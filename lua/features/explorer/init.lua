-- features/explorer/init.lua — Neo-tree file explorer
--
-- Purpose: File tree with git status, diagnostics, icons, preview.
-- Dependencies: neo-tree.nvim
-- Exports: setup()

local M = {}

function M.setup()
  local icons = require("theme.icons")
  local palette = require("theme.palette")
  local constants = require("constants")

  require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style = constants.border,
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = true,
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
      },
      icon = {
        folder_closed = icons.files.folder,
        folder_open = icons.files.folder_open,
        folder_empty = icons.files.folder_empty,
        default = icons.files.file,
      },
      modified = { symbol = icons.files.modified },
      git_status = {
        symbols = {
          added = icons.git.added,
          modified = icons.git.modified,
          deleted = icons.git.removed,
          renamed = icons.git.renamed,
          untracked = icons.git.untracked,
          ignored = icons.git.ignored,
          unstaged = icons.git.unstaged,
          staged = icons.git.staged,
          conflict = icons.git.conflict,
        },
      },
    },
    window = {
      position = "left",
      width = constants.window.sidebar_width,
      mappings = {
        ["<space>"] = "none",
        ["<cr>"] = "open",
        ["l"] = "open",
        ["h"] = "close_node",
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
        ["P"] = { "toggle_preview", config = { use_float = true } },
        ["<bs>"] = "navigate_up",
        ["u"] = "navigate_up",
        ["-"] = "navigate_up",
      },
    },
    filesystem = {
      bind_to_cwd = true,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = { ".git", "node_modules", "__pycache__", ".DS_Store" },
      },
    },
    git_status = { window = { position = "float" } },
    buffers = { follow_current_file = { enabled = true } },
  })
end

return M
