-- theme/highlights/markdown.lua — Markdown rendering highlight groups
local palette = require("theme.palette")

return function()
  local hl = vim.api.nvim_set_hl

  hl(0, "markdownH1", { fg = palette.red, bold = true })
  hl(0, "markdownH2", { fg = palette.orange, bold = true })
  hl(0, "markdownH3", { fg = palette.blue, bold = true })
  hl(0, "markdownH4", { fg = palette.green, bold = true })
  hl(0, "markdownH5", { fg = palette.purple, bold = true })
  hl(0, "markdownH6", { fg = palette.brown, bold = true })
  hl(0, "markdownCode", { fg = palette.green, bg = palette.bg3 })
  hl(0, "markdownCodeBlock", { fg = palette.green })
  hl(0, "markdownCodeDelimiter", { fg = palette.comment })
  hl(0, "markdownBold", { bold = true })
  hl(0, "markdownItalic", { italic = true })
  hl(0, "markdownLinkText", { fg = palette.blue, underline = true })
  hl(0, "markdownUrl", { fg = palette.comment, underline = true })
  hl(0, "markdownListMarker", { fg = palette.orange })
  hl(0, "markdownBlockquote", { fg = palette.comment, italic = true })

  -- render-markdown.nvim groups
  hl(0, "RenderMarkdownH1Bg", { bg = "#1a0a0a" })
  hl(0, "RenderMarkdownH2Bg", { bg = "#1a150a" })
  hl(0, "RenderMarkdownH3Bg", { bg = "#0a0a1a" })
  hl(0, "RenderMarkdownH4Bg", { bg = "#0a1a0a" })
  hl(0, "RenderMarkdownH5Bg", { bg = "#150a1a" })
  hl(0, "RenderMarkdownH6Bg", { bg = "#1a0f0a" })
  hl(0, "RenderMarkdownCode", { bg = palette.bg3 })
end
