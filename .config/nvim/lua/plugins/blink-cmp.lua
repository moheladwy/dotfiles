return {
  "saghen/blink.cmp",
  version = "*",
  optional = true,
  opts = {
    setup = {
      fuzzy = { implementation = "prefer_rust_with_warning" },
      sources = {
        default = { "lsp", "easy-dotnet", "path", "snippets" },
        providers = {
          ["easy-dotnet"] = {
            name = "easy-dotnet",
            enabled = true,
            module = "easy-dotnet.completion.blink",
            score_offset = 10000,
            async = true,
          },
        },
      },
    },
    keymap = {
      ["<Tab>"] = {
        "snippet_forward",
        function()
          if vim.g.ai_accept then return vim.g.ai_accept() end
        end,
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
  },
}
