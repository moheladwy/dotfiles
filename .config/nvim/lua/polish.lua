if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

local dap = require "dap"

local mason_path = vim.fn.stdpath "data" .. "/mason/packages/netcoredbg/netcoredbg"

local netcoredbg_adapter = {
  type = "executable",
  command = mason_path,
  args = { "--interpreter=vscode" },
}

dap.adapters.netcoredbg = netcoredbg_adapter -- needed for normal debugging
dap.adapters.coreclr = netcoredbg_adapter -- needed for unit test debugging

local dotnet = require "configs.nvim-dap-dotnet"

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "Launch .NET Core - netcoredbg",
    request = "launch",
    program = function() return dotnet.build_dll_path() end,
  },
}
