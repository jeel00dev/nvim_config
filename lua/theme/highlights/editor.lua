-- theme/highlights/editor.lua — Core editor highlight groups
--
-- Purpose: Defines editor UI highlight groups matching the user's custom preferences.

local palette = require("theme.palette")

return function()
  local hl = vim.api.nvim_set_hl

  -- Core editor
  hl(0, "Normal", { fg = palette.white, bg = palette.bg })
  hl(0, "NormalNC", { fg = palette.white, bg = palette.bg })
  hl(0, "NormalFloat", { fg = palette.white, bg = palette.bg })
  hl(0, "FloatBorder", { fg = palette.border, bg = palette.bg })
  hl(0, "FloatTitle", { fg = palette.quartz, bg = palette.bg, bold = true })

  -- Cursor & selection
  hl(0, "CursorLine", { bg = palette.bg2 })
  hl(0, "CursorLineNr", { fg = palette.orange })
  hl(0, "LineNr", { fg = palette.bg5 })
  hl(0, "Cursor", { bg = palette.orange })
  hl(0, "Visual", { fg = palette.bg, bg = palette.orange })
  hl(0, "VisualNOS", { fg = palette.bg, bg = palette.orange })

  -- Columns & borders
  hl(0, "ColorColumn", { bg = palette.bg3 })
  hl(0, "MatchParen", { bg = palette.bg3, bold = true })
  hl(0, "Whitespace", { fg = palette.bg4 })
  hl(0, "StatusLine", { fg = palette.white, bg = palette.bg3 })
  hl(0, "StatusLineNC", { fg = palette.quartz, bg = palette.bg3 })
  hl(0, "VertSplit", { fg = palette.border })
  hl(0, "WinSeparator", { fg = palette.border })

  -- Popup menu
  hl(0, "Pmenu", { fg = palette.white, bg = palette.bg2 })
  hl(0, "PmenuSel", { fg = palette.bg, bg = palette.orange })
  hl(0, "PmenuSbar", { bg = palette.bg3 })
  hl(0, "PmenuThumb", { bg = palette.bg4 })

  -- Search
  hl(0, "Search", { fg = palette.bg, bg = palette.orange })
  hl(0, "IncSearch", { fg = palette.bg, bg = palette.orange })
  hl(0, "CurSearch", { fg = palette.bg, bg = palette.orange, bold = true })

  -- Messages
  hl(0, "ErrorMsg", { fg = palette.red })
  hl(0, "WarningMsg", { fg = palette.orange })
  hl(0, "MoreMsg", { fg = palette.green })
  hl(0, "Question", { fg = palette.blue })
  hl(0, "Directory", { fg = palette.blue })
  hl(0, "Title", { fg = palette.blue, bold = true })

  -- Diff
  hl(0, "DiffAdd", { bg = "#1c4c23" })
  hl(0, "DiffChange", { bg = "#143542" })
  hl(0, "DiffDelete", { bg = "#632323" })
  hl(0, "DiffText", { bg = "#205368" })

  -- Misc
  hl(0, "NonText", { fg = palette.bg5 })
  hl(0, "SpecialKey", { fg = palette.bg5 })
  hl(0, "EndOfBuffer", { fg = palette.bg })
end
