-- features/ai/init.lua — AI feature orchestrator
--
-- Purpose: Sets up AI completion via the provider abstraction layer.
-- Exports: setup(), reload()

local M = {}

function M.setup()
  local adapter = require("adapters.ai")
  if not adapter.is_available() then
    return
  end

  local provider = require("features.ai.provider")
  local opts = provider.build_opts()
  if opts then
    require("minuet").setup(opts)
  end
end

function M.reload()
  package.loaded["features.ai.provider"] = nil
  package.loaded["features.ai.minuet"] = nil
  M.setup()
end

return M
