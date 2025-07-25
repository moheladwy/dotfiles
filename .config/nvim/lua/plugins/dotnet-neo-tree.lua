return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      window = {
        mappings = {
          -- Make the mapping anything you want
          ["n"] = "easy",
        },
      },
      commands = {
        ["easy"] = function(state)
          local node = state.tree:get_node()
          local path = node.type == "directory" and node.path or vim.fs.dirname(node.path)
          require("easy-dotnet").create_new_item(
            path,
            function() require("neo-tree.sources.manager").refresh(state.name) end
          )
        end,
      },
    },
  },
}
