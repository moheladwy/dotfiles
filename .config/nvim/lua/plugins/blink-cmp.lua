return {
  "saghen/blink.cmp",
  version = "*",
  config = function()
    require("blink.cmp").setup {
      fuzzy = { implementation = "prefer_rust_with_warning" },
      sources = {
        default = { "lsp", "easy-dotnet", "path" },
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
    }
  end,
}

-- Failed to load `neo-tree`
--
-- /home/eladwy/.config/nvim/lua/neo-tree.lua:1: loop or previous error loading module 'neo-tree'
--
-- # stacktrace:
--   - ~/.config/nvim/lua/neo-tree.lua:1
--   - ~/.config/nvim/lua/neo-tree.lua:1 _in_ **load**
--   - ~/.config/nvim/lua/lazy_setup.lua:1
--   - ~/.config/nvim/init.lua:18
