-- theme/highlights/syntax.lua — Syntax highlight groups
--
-- Purpose: Defines all syntax-related highlights matching the user's custom preferences.

local palette = require("theme.palette")

return function()
  local hl = vim.api.nvim_set_hl

  -- Core syntax
  hl(0, "Comment", { fg = palette.brown, italic = true })
  hl(0, "String", { fg = palette.green })
  hl(0, "Character", { fg = palette.green })
  hl(0, "Function", { fg = palette.blue })
  hl(0, "Identifier", { fg = palette.white })
  hl(0, "Constant", { fg = palette.quartz })
  hl(0, "Type", { fg = palette.blue })
  hl(0, "Special", { fg = palette.red })
  hl(0, "Delimiter", { fg = palette.white })
  hl(0, "Title", { fg = palette.blue, bold = true })

  -- Numbers (purple)
  hl(0, "Number", { fg = palette.purple })
  hl(0, "Float", { fg = palette.purple })
  hl(0, "Boolean", { fg = palette.purple })

  -- Keywords (red)
  hl(0, "Keyword", { fg = palette.red, bold = true })
  hl(0, "Conditional", { fg = palette.red })
  hl(0, "Repeat", { fg = palette.red })
  hl(0, "PreProc", { fg = palette.red })
  hl(0, "Include", { fg = palette.red })
  hl(0, "Label", { fg = palette.red })
  hl(0, "Operator", { fg = palette.red })
  hl(0, "Statement", { fg = palette.red })
  hl(0, "StorageClass", { fg = palette.red })

  -- Todo (orange)
  hl(0, "Todo", { fg = palette.bg, bg = palette.orange })

  -- Treesitter
  hl(0, "@comment", { fg = palette.brown, italic = true })
  hl(0, "@string", { fg = palette.green })
  hl(0, "@function", { fg = palette.green }) -- Green as requested
  hl(0, "@type", { fg = palette.blue })
  hl(0, "@constant", { fg = palette.quartz })
  hl(0, "@keyword", { fg = palette.red, bold = true })
  hl(0, "@conditional", { fg = palette.red })
  hl(0, "@repeat", { fg = palette.red })
  hl(0, "@preproc", { fg = palette.red })
  hl(0, "@operator", { fg = palette.red })
  hl(0, "@variable", { fg = palette.white })
  hl(0, "@parameter", { fg = palette.white })
  hl(0, "@field", { fg = palette.white })
  hl(0, "@number", { fg = palette.purple })

  -- Compatibility links / overrides
  hl(0, "tsfunction", { fg = palette.green })
  hl(0, "tskeyword", { link = "Keyword" })
  hl(0, "tsstring", { link = "String" })

  -- Extra: white → targeted orange rules
  hl(0, "@constant.macro", { fg = palette.orange })
  hl(0, "macro", { fg = palette.orange })
  hl(0, "@constant.builtin", { fg = palette.orange })
  hl(0, "@variable.constant", { fg = palette.orange })

  -- Extra Preproc / Operator links
  hl(0, "cpppreproc", { link = "Keyword" })
  hl(0, "cpreproc", { link = "Keyword" })
  hl(0, "preproc", { link = "Keyword" })
  hl(0, "operator", { link = "Keyword" })
  hl(0, "tsnumber", { link = "Number" })
end
