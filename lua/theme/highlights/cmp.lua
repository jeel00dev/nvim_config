-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  theme/highlights/cmp.lua — Completion menu highlight groups        ║
-- ╚══════════════════════════════════════════════════════════════════════╝

local palette = require("theme.palette")

return function()
  local hl = vim.api.nvim_set_hl

  -- Completion menu
  hl(0, "CmpItemAbbrMatch", { fg = palette.blue, bold = true })
  hl(0, "CmpItemAbbrMatchFuzzy", { fg = palette.blue })
  hl(0, "CmpItemAbbr", { fg = palette.white })
  hl(0, "CmpItemAbbrDeprecated", { fg = palette.comment, strikethrough = true })
  hl(0, "CmpItemMenu", { fg = palette.comment })

  -- Completion kinds
  hl(0, "CmpItemKindFunction", { fg = palette.blue })
  hl(0, "CmpItemKindMethod", { fg = palette.blue })
  hl(0, "CmpItemKindVariable", { fg = palette.white })
  hl(0, "CmpItemKindField", { fg = palette.white })
  hl(0, "CmpItemKindProperty", { fg = palette.white })
  hl(0, "CmpItemKindClass", { fg = palette.orange })
  hl(0, "CmpItemKindInterface", { fg = palette.orange })
  hl(0, "CmpItemKindStruct", { fg = palette.orange })
  hl(0, "CmpItemKindModule", { fg = palette.blue })
  hl(0, "CmpItemKindKeyword", { fg = palette.purple })
  hl(0, "CmpItemKindSnippet", { fg = palette.green })
  hl(0, "CmpItemKindText", { fg = palette.white })
  hl(0, "CmpItemKindFile", { fg = palette.white })
  hl(0, "CmpItemKindFolder", { fg = palette.blue })
  hl(0, "CmpItemKindConstant", { fg = palette.orange })
  hl(0, "CmpItemKindEnum", { fg = palette.orange })
  hl(0, "CmpItemKindEnumMember", { fg = palette.orange })
  hl(0, "CmpItemKindValue", { fg = palette.orange })
  hl(0, "CmpItemKindOperator", { fg = palette.quartz })
  hl(0, "CmpItemKindTypeParameter", { fg = palette.blue })

  -- Ghost text (AI / blink.cmp)
  hl(0, "CmpGhostText", { fg = palette.comment, italic = true })
  hl(0, "BlinkCmpGhostText", { fg = palette.comment, italic = true })
end
