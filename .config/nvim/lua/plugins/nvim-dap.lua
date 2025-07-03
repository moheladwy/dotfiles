-- This file sets up the Neovim DAP (Debug Adapter Protocol) for debugging C# applications
--
-- Requires the `nvim-dap` plugin and the `nvim-dap-dotnet` module for C# support.
local dap = require "dap"

-- Set up the DAP configuration for C# using the netcoredbg adapter.
local dotnet = require "nvim-dap-dotnet"

-- Ensure the netcoredbg path is set correctly based on Mason's installation.
local netcoredbg_mason_path = vim.fn.stdpath "data" .. "/mason/packages/netcoredbg/netcoredbg"

-- Set up the netcoredbg adapter for debugging .NET applications.
local netcoredbg_adapter = {
  type = "executable",
  command = netcoredbg_mason_path,
  args = { "--interpreter=vscode" },
}

dap.adapters.netcoredbg = netcoredbg_adapter -- needed for normal debugging.
dap.adapters.coreclr = netcoredbg_adapter -- needed for debugging unit tests.

-- Define the DAP configurations for C#.
dap.configurations.cs = {
  {
    type = "coreclr",
    name = "Launch .NET Core - netcoredbg",
    request = "launch",
    program = function()
      return dotnet.build_dll_path()
    end,
  }
}
