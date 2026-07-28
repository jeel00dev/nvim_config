-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  constants.lua — Non-theme application constants                    ║
-- ║                                                                      ║
-- ║  Purpose: Central location for values used across the config that    ║
-- ║  are NOT visual/theme-related. Theme constants live in theme/.       ║
-- ║                                                                      ║
-- ║  Dependencies: None (loaded before everything else)                  ║
-- ╚══════════════════════════════════════════════════════════════════════╝

local M = {}

-- Border style used across all floating windows, popups, and hover docs.
-- Changing this single value updates every UI surface.
M.border = "rounded"

-- Timeout values (milliseconds)
M.timeouts = {
  updatetime = 250, -- CursorHold delay
  timeoutlen = 300, -- Mapping sequence timeout
  debounce = 150, -- General debounce for expensive operations
  notification = 3000, -- Notification display duration
}

-- Default window sizing ratios (0.0–1.0)
M.window = {
  width = 0.8,
  height = 0.8,
  min_width = 60,
  min_height = 20,
  sidebar_width = 35,
}

-- Common autocommand events grouped for convenience
M.events = {
  enter_buffer = { "BufReadPost", "BufNewFile" },
  modify_buffer = { "TextChanged", "InsertLeave" },
  file_type = "FileType",
  very_lazy = "VeryLazy",
  buf_read = "BufReadPre",
}

-- Filetype groups for conditional behavior
M.filetypes = {
  ui = {
    "alpha",
    "lazy",
    "mason",
    "neo-tree",
    "notify",
    "toggleterm",
    "trouble",
    "qf",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "checkhealth",
  },
  markdown = { "markdown", "mdx" },
  web = { "html", "css", "scss", "javascript", "typescript", "javascriptreact", "typescriptreact" },
  systems = { "c", "cpp", "rust", "go", "zig" },
  scripting = { "lua", "python", "bash", "sh", "zsh", "fish" },
  data = { "json", "jsonc", "yaml", "toml" },
}

-- Plugin names (avoid typos when referencing plugins across modules)
M.plugins = {
  catppuccin = "catppuccin",
  lualine = "lualine",
  bufferline = "bufferline",
  neo_tree = "neo-tree",
  fzf_lua = "fzf-lua",
  blink_cmp = "blink.cmp",
  noice = "noice",
  notify = "notify",
  gitsigns = "gitsigns",
  trouble = "trouble",
  toggleterm = "toggleterm",
}

return M
