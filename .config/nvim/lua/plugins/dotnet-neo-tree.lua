-- Configuration for the Neo-tree.nvim plugin
return {
  "nvim-neo-tree/neo-tree.nvim", -- Repository for Neo-tree.nvim plugin
  opts = {
    filesystem = { -- Configuration related to the filesystem
      window = {
        mappings = {
          ["n"] = "easy", -- Keymap: Press 'n' to trigger the "easy" command
        },
      },
      commands = {
        ["easy"] = function(state) -- Define the "easy" command
          local node = state.tree:get_node() -- Get the current node
          local path = node.type == "directory" and node.path or vim.fs.dirname(node.path) -- Get the path of the current node
          require("easy-dotnet").create_new_item( -- Call the create_new_item function from the "easy-dotnet" module
            path, -- Pass the directory path
            function() require("neo-tree.sources.manager").refresh(state.name) end -- Refresh the Neo-tree source after creating a new item
          )
        end,
      },
    },
  },
}
