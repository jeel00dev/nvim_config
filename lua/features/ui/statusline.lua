-- features/ui/statusline.lua — Lualine statusline configuration
--
-- Purpose: Minimal, informative statusline using the custom palette.
-- Shows: mode, git branch, diff, filename, diagnostics, filetype, position.
--
-- Dependencies: lualine.nvim
-- Exports: setup()

local M = {}

function M.setup()
  local palette = require("theme.palette")
  local icons = require("theme.icons")

  -- Custom theme using our palette
  local custom_theme = {
    normal = {
      a = { fg = palette.bg, bg = palette.blue, gui = "bold" },
      b = { fg = palette.white, bg = palette.bg3 },
      c = { fg = palette.comment, bg = palette.statusline_bg },
    },
    insert = {
      a = { fg = palette.bg, bg = palette.green, gui = "bold" },
    },
    visual = {
      a = { fg = palette.bg, bg = palette.purple, gui = "bold" },
    },
    replace = {
      a = { fg = palette.bg, bg = palette.red, gui = "bold" },
    },
    command = {
      a = { fg = palette.bg, bg = palette.orange, gui = "bold" },
    },
    inactive = {
      a = { fg = palette.comment, bg = palette.statusline_bg },
      b = { fg = palette.comment, bg = palette.statusline_bg },
      c = { fg = palette.comment, bg = palette.statusline_bg },
    },
  }

  require("lualine").setup({
    options = {
      theme = custom_theme,
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "alpha" },
        winbar = {},
      },
    },
    sections = {
      lualine_a = {
        { "mode", fmt = function(str) return str:sub(1, 3) end },
      },
      lualine_b = {
        { "branch", icon = icons.git.branch },
        {
          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
          colored = true,
          diff_color = {
            added = { fg = palette.added },
            modified = { fg = palette.changed },
            removed = { fg = palette.removed },
          },
        },
      },
      lualine_c = {
        {
          "filename",
          path = 1, -- relative path
          symbols = {
            modified = icons.files.modified,
            readonly = icons.files.readonly,
            unnamed = "[No Name]",
            newfile = "[New]",
          },
        },
      },
      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = {
            error = icons.diagnostics.error,
            warn = icons.diagnostics.warn,
            info = icons.diagnostics.info,
            hint = icons.diagnostics.hint,
          },
          colored = true,
          diagnostics_color = {
            error = { fg = palette.error },
            warn = { fg = palette.warn },
            info = { fg = palette.info },
            hint = { fg = palette.hint },
          },
        },
      },
      lualine_y = {
        { "filetype", icon_only = true },
        { "encoding", fmt = function(str) return str ~= "utf-8" and str or "" end },
      },
      lualine_z = {
        { "location" },
        { "progress" },
      },
    },
    extensions = { "neo-tree", "lazy", "toggleterm", "trouble" },
  })
end

return M
