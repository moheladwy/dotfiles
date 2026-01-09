-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "bash",
      "typescript",
      "javascript",
      "json",
      "yaml",
      "html",
      "css",
      "markdown",
      "python",
      "cpp",
      "java",
      "c",
      "c_sharp",
    },
  },
}
