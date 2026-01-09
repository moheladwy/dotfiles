-- This file sets up configurations for the 'nvim-dap' plugin to support .NET development.
-- It provides a smooth debugging experience for .NET applications using the Debug Adapter Protocol (DAP).

--- Rebuilds a solution asynchronously.
-- @param co The coroutine context for yielding the async operation.
-- @param path The path to the solution file to rebuild.
-- @throws an error if the rebuild fails or the solution file does not exist.
local function rebuild_project_async(co, path)
  local spinner = require("easy-dotnet.ui-modules.spinner").new()
  spinner:start_spinner "Building"
  vim.fn.jobstart(string.format("dotnet build %s", path), {
    on_exit = function(_, return_code)
      if return_code == 0 then
        spinner:stop_spinner "Built successfully"
      else
        spinner:stop_spinner("Build failed with exit code " .. return_code, vim.log.levels.ERROR)
        error "Build failed"
      end
      coroutine.resume(co)
    end,
  })
  coroutine.yield()
end

return {
  "mfussenegger/nvim-dap",
  enabled = true,
  config = function()
    local dap = require "dap"
    local dotnet = require "easy-dotnet"
    local dapui = require "dapui"
    dap.set_log_level "TRACE"

    -- Automatically open/close UI for debugging sessions
    dap.listeners.before.attach.dapui_setup = function() dapui.open() end
    dap.listeners.before.launch.dapui_setup = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_setup = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_setup = function() dapui.close() end

    -- DAP key mappings for easier navigation and control.
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue debugging" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
    vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Open REPL" })

    -- Utility to verify if the file exists
    local function file_exists(filepath)
      local stat = vim.loop.fs_stat(filepath)
      return stat and stat.type == "file"
    end

    -- Cache for the debug DLL path
    local debug_dll = nil

    -- Ensures that the debug DLL path is retrieved and cached
    local function ensure_dll()
      if debug_dll ~= nil then return debug_dll end
      local dll = dotnet.get_debug_dll()
      debug_dll = dll
      return dll
    end

    -- DAP configurations for C# and F#
    for _, lang in ipairs { "cs", "fsharp" } do
      dap.configurations[lang] = {
        {
          type = "coreclr",
          name = "Debug Program",
          request = "launch",
          program = function()
            local dll = ensure_dll()
            local co = coroutine.running()
            rebuild_project_async(co, dll.project_path)
            if not file_exists(dll.target_path) then
              error("Build failed, target path not found: " .. dll.target_path)
            end
            return dll.target_path
          end,
          cwd = function()
            local dll = ensure_dll()
            return dll.absolute_project_path
          end,
          env = function()
            local dll = ensure_dll()
            return dotnet.get_environment_variables(dll.project_name, dll.absolute_project_path, false)
          end,
        },
      }

      -- Listener for cleanup tasks for easy-dotnet
      dap.listeners.before["event_terminated"].easy_dotnet_cleanup = function() debug_dll = nil end
    end

    -- DAP Adapter for .NET debugging
    dap.adapters.coreclr = {
      type = "executable",
      command = "netcoredbg",
      args = { "--interpreter=vscode" },
    }
  end,

  -- Dependencies required for debugging and UI
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      config = function() require("dapui").setup() end,
    },
  },
}
