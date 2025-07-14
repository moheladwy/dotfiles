-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 20000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
      update_in_insert = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      -- extension = {
      --   foo = "fooscript",
      -- },
      -- filename = {
      --   [".foorc"] = "fooscript",
      -- },
      -- pattern = {
      --   [".*/etc/foo/.*"] = "fooscript",
      -- },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        -- Go to next buffer with <A-TAB> and previous buffer with <S-TAB>
        ["<A-TAB>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-TAB>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        -- go to declaration/definition of symbol under cursor
        ["<F12>"] = {
          function() vim.lsp.buf.declaration() end,
          desc = "Go to declaration/definition of the symbol under cursor",
          -- cond = "textDocument/declaration"
        },
        -- Go to type definition of symbol under cursor.
        ["<C-F12>"] = {
          function() vim.lsp.buf.implementation() end,
          desc = "Go to implementation of the symbol under cursor",
        },
        -- Show all references of the symbol under cursor.
        ["<C-S-F12>"] = {
          function() vim.lsp.buf.references() end,
          desc = "Show all references of the symbol under cursor",
        },

        -- Show Dotnet Commands from easy-dtonet
        ["<leader>D"] = {
          function() vim.cmd "Dotnet" end,
          desc = "Show Dotnet Commands",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
