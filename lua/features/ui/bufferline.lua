-- features/ui/bufferline.lua — Bufferline tab bar configuration
--
-- Purpose: Tab bar showing open buffers with diagnostics and close buttons.
-- Styled with the custom palette. Offsets for neo-tree sidebar.
--
-- Dependencies: bufferline.nvim
-- Exports: setup()

local M = {}

function M.setup()
  local palette = require("theme.palette")
  local icons = require("theme.icons")
  local constants = require("constants")

  require("bufferline").setup({
    options = {
      mode = "buffers",
      themable = true,
      numbers = "none",
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      indicator = { style = "underline" },
      modified_icon = icons.files.modified,
      close_icon = icons.ui.close,
      left_trunc_marker = icons.ui.arrow_left,
      right_trunc_marker = icons.ui.arrow_right,
      max_name_length = 24,
      max_prefix_length = 15,
      tab_size = 20,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and icons.diagnostics.error
          or level:match("warn") and icons.diagnostics.warn
          or icons.diagnostics.info
        return " " .. icon .. count
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Explorer",
          highlight = "Directory",
          text_align = "center",
          separator = true,
        },
      },
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      show_tab_indicators = true,
      separator_style = "thin",
      always_show_bufferline = true,
      sort_by = "insert_after_current",
    },
    highlights = {
      fill = { bg = palette.bg },
      background = { fg = palette.comment, bg = palette.bg },
      buffer_selected = { fg = palette.quartz, bg = palette.bg, bold = true },
      buffer_visible = { fg = palette.white, bg = palette.bg },
      close_button = { fg = palette.comment, bg = palette.bg },
      close_button_selected = { fg = palette.red, bg = palette.bg },
      close_button_visible = { fg = palette.comment, bg = palette.bg },
      indicator_selected = { fg = palette.blue, bg = palette.bg },
      indicator_visible = { fg = palette.bg5, bg = palette.bg },
      modified = { fg = palette.changed, bg = palette.bg },
      modified_selected = { fg = palette.changed, bg = palette.bg },
      modified_visible = { fg = palette.changed, bg = palette.bg },
      separator = { fg = palette.bg, bg = palette.bg },
      separator_selected = { fg = palette.bg, bg = palette.bg },
      separator_visible = { fg = palette.bg, bg = palette.bg },
      tab = { fg = palette.comment, bg = palette.bg },
      tab_selected = { fg = palette.quartz, bg = palette.bg, bold = true },
      tab_separator = { fg = palette.bg, bg = palette.bg },
      tab_separator_selected = { fg = palette.blue, bg = palette.bg },
      diagnostic = { fg = palette.comment, bg = palette.bg },
      diagnostic_selected = { fg = palette.quartz, bg = palette.bg },
      diagnostic_visible = { fg = palette.comment, bg = palette.bg },
    },
  })
end

return M
