-- features/ai/provider.lua — AI provider dispatcher
--
-- Purpose: Reads config and builds provider-specific options.
-- Today dispatches to minuet.lua. Tomorrow could dispatch to
-- another provider without changing the rest of the editor.

local M = {}

--- Build provider options from centralized config.
function M.build_opts()
  local ai_config = require("adapters.ai").get_config()

  if ai_config.provider == "minuet" then
    return require("features.ai.minuet").build_opts(ai_config)
  end

  -- Future providers would be added here:
  -- if ai_config.provider == "copilot" then ... end

  vim.notify("Unknown AI provider: " .. ai_config.provider, vim.log.levels.WARN)
  return nil
end

return M
