-- Overrides for coder/claudecode.nvim (installed via astrocommunity.ai.claudecode-nvim in lua/community.lua).
-- The community pack provides the <Leader>A* keymaps; this file only tunes the plugin options.
-- Every value below is the plugin's default, so change only what you want.
-- Docs: https://github.com/coder/claudecode.nvim#advanced-configuration

---@type LazySpec
return {
  "coder/claudecode.nvim",
  init = function()
    -- Inside the Claude window (terminal mode), <C-q> leaves terminal mode and toggles the window closed.
    -- The session keeps running; reopen it with <Leader>Ac or <Leader>Af.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "claudecode",
      callback = function(args)
        vim.keymap.set("t", "<C-q>", "<C-\\><C-n><Cmd>ClaudeCodeFocus<CR>", {
          buffer = args.buf,
          desc = "Hide Claude window (keep session)",
        })
      end,
    })
  end,
  opts = {
    -- Server
    port_range = { min = 10000, max = 65535 },
    auto_start = true, -- start the WebSocket server when Neovim starts
    log_level = "info", -- "trace" | "debug" | "info" | "warn" | "error"
    terminal_cmd = nil, -- command used to launch Claude (default: "claude"), e.g. vim.fn.exepath("claude")
    env = {}, -- extra environment variables for the Claude process

    -- Send / focus behavior
    focus_after_send = false, -- focus the Claude terminal after :ClaudeCodeSend / :ClaudeCodeAdd

    -- Selection tracking
    track_selection = true, -- share the current selection with Claude
    visual_demotion_delay_ms = 50,

    -- @-mention queueing while Claude connects
    connection_wait_delay = 600, -- ms to wait after connecting before sending queued mentions
    connection_timeout = 10000, -- ms Claude has to connect before queued mentions fail

    -- Models offered by :ClaudeCodeSelectModel (value is passed to `claude --model`)
    models = {
      { name = "Claude Opus (Latest)", value = "opus" },
      { name = "Claude Opus (Latest, 1M context)", value = "opus[1m]" },
      { name = "Claude Sonnet (Latest)", value = "sonnet" },
      { name = "Claude Sonnet (Latest, 1M context)", value = "sonnet[1m]" },
      { name = "Claude Haiku (Latest)", value = "haiku" },
      { name = "Default (account recommended)", value = "default" },
    },

    -- Terminal
    terminal = {
      split_side = "right", -- "left" | "right"
      split_width_percentage = 0.40,
      diff_split_width_percentage = nil, -- terminal width while a diff is open (nil = split_width_percentage)
      provider = "auto", -- "auto" | "snacks" | "native" | "external" | "none" | custom provider table
      auto_close = true, -- close the window when Claude exits
      auto_insert = true, -- enter terminal (typing) mode when the Claude window gains focus
      show_native_term_exit_tip = true, -- only used by the "native" provider
      snacks_win_opts = {}, -- passed to Snacks.terminal.open(), e.g. { position = "float", width = 0.9, height = 0.9 }
      fix_streamed_paste = "auto", -- workaround for large-paste truncation on Neovim < 0.12.2: true | false | "auto"

      -- Working directory Claude is started in
      cwd = nil, -- fixed directory
      git_repo_cwd = false, -- use the git root of the current file
      cwd_provider = nil, -- function(ctx) return "<dir>" end

      provider_opts = {
        -- Only for provider = "external": "alacritty -e %s" or function(cmd, env) ... end
        external_terminal_cmd = nil,
      },
    },

    -- Diffs for Claude's proposed edits
    diff_opts = {
      layout = "vertical", -- "vertical" | "horizontal" | "unified"
      open_in_new_tab = false,
      keep_terminal_focus = false, -- move focus back to Claude after a diff opens
      hide_terminal_in_new_tab = false, -- with open_in_new_tab, don't show Claude in that tab
      on_new_file_reject = "keep_empty", -- "keep_empty" | "close_window"
      auto_resize_terminal = true,
    },
  },
}
