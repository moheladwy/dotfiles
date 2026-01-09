-- This is the main return table that configures the Copilot plugin
return {
  "zbirenbaum/copilot.lua", -- Plugin repository for Copilot
  cmd = "Copilot", -- Command to trigger Copilot
  build = ":Copilot auth", -- Build step to authenticate Copilot usage
  event = "BufReadPost", -- Event that triggers loading the plugin: after a buffer is read
  opts = {
    suggestion = { -- Options specific to suggestions
      keymap = {
        accept = false, -- Keyboard shortcuts for suggestion acceptance are handled by the completion engine
      },
    },
  },
  specs = { -- Additional specifications for related plugins
    {
      "AstroNvim/astrocore", -- AstroNvim Core plugin
      opts = {
        options = {
          g = { -- Global options
            ai_accept = function() -- Function for accepting AI suggestions from Copilot
              if require("copilot.suggestion").is_visible() then -- If suggestions are visible
                require("copilot.suggestion").accept() -- Accept the suggestion
                return true -- Indicate success
              else
                return false -- Suggestion not accepted
              end
            end,
          },
        },
      },
    },
  },
}
