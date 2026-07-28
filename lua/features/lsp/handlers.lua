-- features/lsp/handlers.lua — Custom LSP handlers
--
-- Purpose: Override default hover and signature help with rounded borders.

local M = {}

function M.setup()
  local border = require("constants").border

  -- Rounded borders for hover
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = border }
  )

  -- Rounded borders for signature help
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = border }
  )
end

return M
