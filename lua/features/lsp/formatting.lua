-- features/lsp/formatting.lua — LSP formatting fallback
--
-- Purpose: Provides a format function that uses LSP if conform is unavailable.

local M = {}

function M.format()
  -- Prefer conform if available
  local ok, conform = pcall(require, "conform")
  if ok then
    conform.format({ async = true, lsp_fallback = true })
    return
  end
  -- Fallback to LSP formatting
  vim.lsp.buf.format({ async = true })
end

return M
