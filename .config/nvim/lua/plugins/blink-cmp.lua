-- Configuration table for the Blink.cmp plugin
return {
  "saghen/blink.cmp", -- Repository for the Blink.cmp plugin
  version = "*", -- Use the latest version of the plugin
  optional = true, -- Specifies that this plugin is optional
  opts = {
    setup = { -- Setup options for the plugin
      fuzzy = { implementation = "prefer_rust_with_warning" }, -- Fuzzy matching with a preference for Rust
      sources = { -- Configuration for completion sources
        default = { "lsp", "easy-dotnet", "path", "snippets" }, -- Default completion sources
        providers = { -- Additional provider configurations
          ["easy-dotnet"] = {
            name = "easy-dotnet", -- Provider name
            enabled = true, -- Enable the provider
            module = "easy-dotnet.completion.blink", -- Module to use for this provider
            score_offset = 10000, -- Offset for scoring match importance
            async = true, -- Asynchronous loading for the provider
          },
        },
      },
    },
    keymap = { -- Keymaps for the plugin
      ["<Tab>"] = {
        "snippet_forward", -- Navigate forward in snippets
        function()
          if vim.g.ai_accept then return vim.g.ai_accept() end -- Custom function for AI-based completion
        end,
        "fallback", -- Fallback action
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" }, -- Navigate backward in snippets
    },
  },
}
