-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  theme/highlights/lsp.lua — LSP & diagnostic highlight groups       ║
-- ╚══════════════════════════════════════════════════════════════════════╝

local palette = require("theme.palette")

return function()
  local hl = vim.api.nvim_set_hl

  -- Diagnostic signs
  hl(0, "DiagnosticError", { fg = palette.error })
  hl(0, "DiagnosticWarn", { fg = palette.warn })
  hl(0, "DiagnosticInfo", { fg = palette.info })
  hl(0, "DiagnosticHint", { fg = palette.hint })

  -- Diagnostic underlines
  hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = palette.error })
  hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = palette.warn })
  hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = palette.info })
  hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = palette.hint })

  -- Diagnostic virtual text
  hl(0, "DiagnosticVirtualTextError", { fg = palette.error, bg = "#1a0a0a" })
  hl(0, "DiagnosticVirtualTextWarn", { fg = palette.warn, bg = "#1a150a" })
  hl(0, "DiagnosticVirtualTextInfo", { fg = palette.info, bg = "#0a0a1a" })
  hl(0, "DiagnosticVirtualTextHint", { fg = palette.hint, bg = "#0a1a0a" })

  -- Diagnostic floating windows
  hl(0, "DiagnosticFloatingError", { fg = palette.error })
  hl(0, "DiagnosticFloatingWarn", { fg = palette.warn })
  hl(0, "DiagnosticFloatingInfo", { fg = palette.info })
  hl(0, "DiagnosticFloatingHint", { fg = palette.hint })

  -- Diagnostic signs in signcolumn
  hl(0, "DiagnosticSignError", { fg = palette.error, bg = palette.bg })
  hl(0, "DiagnosticSignWarn", { fg = palette.warn, bg = palette.bg })
  hl(0, "DiagnosticSignInfo", { fg = palette.info, bg = palette.bg })
  hl(0, "DiagnosticSignHint", { fg = palette.hint, bg = palette.bg })

  -- LSP reference highlights
  hl(0, "LspReferenceText", { bg = palette.bg3 })
  hl(0, "LspReferenceRead", { bg = palette.bg3 })
  hl(0, "LspReferenceWrite", { bg = palette.bg3, underline = true })

  -- LSP signature
  hl(0, "LspSignatureActiveParameter", { fg = palette.orange, bold = true })

  -- LSP inlay hints
  hl(0, "LspInlayHint", { fg = palette.comment, italic = true })

  -- LSP Semantic Tokens (link to customized Treesitter/syntax groups)
  hl(0, "@lsp.type.class", { link = "@type" })
  hl(0, "@lsp.type.decorator", { link = "@function" })
  hl(0, "@lsp.type.enum", { link = "@type" })
  hl(0, "@lsp.type.enumMember", { link = "@constant" })
  hl(0, "@lsp.type.function", { link = "@function" })
  hl(0, "@lsp.type.interface", { link = "@type" })
  hl(0, "@lsp.type.macro", { link = "@function.macro" })
  hl(0, "@lsp.type.method", { link = "@method" })
  hl(0, "@lsp.type.namespace", { link = "@namespace" })
  hl(0, "@lsp.type.parameter", { link = "@variable.parameter" })
  hl(0, "@lsp.type.property", { link = "@property" })
  hl(0, "@lsp.type.struct", { link = "@type" })
  hl(0, "@lsp.type.typeParameter", { link = "@type" })
  hl(0, "@lsp.type.variable", { link = "@variable" })
  hl(0, "@lsp.type.keyword", { link = "@keyword" })
  hl(0, "@lsp.type.modifier", { link = "@keyword" })
  hl(0, "@lsp.type.comment", { link = "@comment" })
  hl(0, "@lsp.type.string", { link = "@string" })
  hl(0, "@lsp.type.number", { link = "@number" })
  hl(0, "@lsp.type.operator", { link = "@operator" })
end
