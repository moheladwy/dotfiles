-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "csharp-language-server",
        "typescript-language-server",
        "html-lsp",
        "css-lsp",
        "eslint-lsp",

        -- install formatters
        "stylua",

        -- install debuggers
        "netcoredbg",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
