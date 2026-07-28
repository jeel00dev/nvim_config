-- adapters/completion.lua — Completion abstraction
--
-- Purpose: Thin wrapper over blink.cmp capabilities so LSP and other
-- modules don't depend directly on the completion plugin.

local M = {}

--- Get completion capabilities for LSP server config.
---@return table capabilities
function M.capabilities()
  local ok, blink = pcall(require, "blink.cmp")
  if ok then
    return blink.get_lsp_capabilities()
  end
  return vim.lsp.protocol.make_client_capabilities()
end

return M
