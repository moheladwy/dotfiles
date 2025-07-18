-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "vscode",
    folding = {
      enabled = function(bufnr) return require("astrocore.buffer").is_valid(bufnr) end,
      methods = { "lsp", "treesitter", "indent" },
    },
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrodark = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      ActiveLSP = "",
      ActiveTS = " ",
      BufferClose = "",
      DapBreakpoint = "",
      DapBreakpointCondition = "",
      DapBreakpointRejected = "",
      DapLogPoint = "",
      DapStopped = "",
      DefaultFile = "",
      Diagnostic = "",
      DiagnosticError = "",
      DiagnosticHint = "",
      DiagnosticInfo = "",
      DiagnosticWarn = "",
      Ellipsis = "",
      FileModified = "",
      FileReadOnly = "",
      FoldClosed = "",
      FoldOpened = "",
      FolderClosed = "",
      FolderEmpty = "",
      FolderOpen = "",
      Git = "",
      GitAdd = "",
      GitBranch = "",
      GitChange = "",
      GitConflict = "",
      GitDelete = "",
      GitIgnored = "",
      GitRenamed = "",
      GitStaged = "",
      GitUnstaged = "",
      GitUntracked = "",
      LSPLoaded = "",
      LSPLoading1 = "",
      LSPLoading2 = "",
      LSPLoading3 = "",
      MacroRecording = "",
      Paste = "",
      Search = "",
      Selected = "",
      TabClose = "",
    },
  },
}
