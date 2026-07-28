-- features/lsp/diagnostics.lua — Diagnostic configuration
--
-- Purpose: Configure diagnostic signs, virtual text, and severity display.

local M = {}

function M.setup()
  local icons = require("theme.icons")

  -- Diagnostic signs in the signcolumn
  local signs = {
    { name = "DiagnosticSignError", text = icons.diagnostics.error },
    { name = "DiagnosticSignWarn", text = icons.diagnostics.warn },
    { name = "DiagnosticSignInfo", text = icons.diagnostics.info },
    { name = "DiagnosticSignHint", text = icons.diagnostics.hint },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  -- Diagnostic display config
  vim.diagnostic.config({
    virtual_text = false, -- tiny-inline-diagnostic handles this
    signs = { active = signs },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = require("constants").border,
      source = "always",
      header = "",
      prefix = "",
    },
  })
end

return M
