-- theme/highlights/ui.lua — UI component highlight groups
local palette = require("theme.palette")

return function()
  local hl = vim.api.nvim_set_hl

  -- Statusline
  hl(0, "StatusLine", { fg = palette.white, bg = palette.statusline_bg })
  hl(0, "StatusLineNC", { fg = palette.comment, bg = palette.statusline_bg })

  -- Tabline
  hl(0, "TabLine", { fg = palette.comment, bg = palette.bg })
  hl(0, "TabLineFill", { bg = palette.bg })
  hl(0, "TabLineSel", { fg = palette.quartz, bg = palette.bg3 })

  -- Winbar
  hl(0, "WinBar", { fg = palette.white, bg = palette.bg })
  hl(0, "WinBarNC", { fg = palette.comment, bg = palette.bg })

  -- Notifications
  hl(0, "NotifyINFOBody", { fg = palette.white, bg = palette.float_bg })
  hl(0, "NotifyWARNBody", { fg = palette.white, bg = palette.float_bg })
  hl(0, "NotifyERRORBody", { fg = palette.white, bg = palette.float_bg })
  hl(0, "NotifyINFOBorder", { fg = palette.info, bg = palette.float_bg })
  hl(0, "NotifyWARNBorder", { fg = palette.warn, bg = palette.float_bg })
  hl(0, "NotifyERRORBorder", { fg = palette.error, bg = palette.float_bg })
  hl(0, "NotifyINFOTitle", { fg = palette.info })
  hl(0, "NotifyWARNTitle", { fg = palette.warn })
  hl(0, "NotifyERRORTitle", { fg = palette.error })
  hl(0, "NotifyINFOIcon", { fg = palette.info })
  hl(0, "NotifyWARNIcon", { fg = palette.warn })
  hl(0, "NotifyERRORIcon", { fg = palette.error })

  -- WhichKey
  hl(0, "WhichKey", { fg = palette.blue })
  hl(0, "WhichKeyGroup", { fg = palette.purple })
  hl(0, "WhichKeyDesc", { fg = palette.white })
  hl(0, "WhichKeySeparator", { fg = palette.comment })
  hl(0, "WhichKeyFloat", { bg = palette.float_bg })
  hl(0, "WhichKeyBorder", { fg = palette.border, bg = palette.float_bg })

  -- NeoTree
  hl(0, "NeoTreeNormal", { fg = palette.white, bg = palette.bg })
  hl(0, "NeoTreeNormalNC", { fg = palette.white, bg = palette.bg })
  hl(0, "NeoTreeDirectoryIcon", { fg = palette.blue })
  hl(0, "NeoTreeDirectoryName", { fg = palette.blue })
  hl(0, "NeoTreeRootName", { fg = palette.quartz, bold = true })
  hl(0, "NeoTreeGitAdded", { fg = palette.added })
  hl(0, "NeoTreeGitModified", { fg = palette.changed })
  hl(0, "NeoTreeGitDeleted", { fg = palette.removed })
  hl(0, "NeoTreeIndentMarker", { fg = palette.bg5 })
  hl(0, "NeoTreeWinSeparator", { fg = palette.bg, bg = palette.bg })

  -- FzfLua
  hl(0, "FzfLuaNormal", { fg = palette.white, bg = palette.float_bg })
  hl(0, "FzfLuaBorder", { fg = palette.border, bg = palette.float_bg })
  hl(0, "FzfLuaTitle", { fg = palette.quartz, bg = palette.float_bg, bold = true })

  -- Indent guides
  hl(0, "IblIndent", { fg = palette.bg4 })
  hl(0, "IblScope", { fg = palette.bg5 })

  -- Alpha (dashboard)
  hl(0, "AlphaHeader", { fg = palette.blue })
  hl(0, "AlphaButtons", { fg = palette.white })
  hl(0, "AlphaShortcut", { fg = palette.orange })
  hl(0, "AlphaFooter", { fg = palette.comment, italic = true })
end
