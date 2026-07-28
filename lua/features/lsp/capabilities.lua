-- features/lsp/capabilities.lua — LSP capabilities
--
-- Purpose: Build merged capabilities from Neovim defaults + completion plugin.

local M = {}

function M.get()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- Merge with completion adapter capabilities
  local ok, adapter_caps = pcall(function()
    return require("adapters.completion").capabilities()
  end)
  if ok and adapter_caps then
    capabilities = vim.tbl_deep_extend("force", capabilities, adapter_caps)
  end
  -- Enable folding capabilities for UFO (future)
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  return capabilities
end

return M
