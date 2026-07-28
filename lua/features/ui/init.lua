-- features/ui/init.lua — UI feature orchestrator
--
-- Purpose: Coordinates all UI sub-features. Each sub-module has its
-- own setup() that is called when the corresponding plugin loads.
-- This init.lua provides the top-level setup/reload/health API.
--
-- Exports: setup(), reload(), health()

local M = {}

function M.setup()
  -- Dashboard is set up via its plugin config callback.
  -- Other UI features (statusline, bufferline, noice, notify, etc.)
  -- will be added in Phase 2.
end

function M.reload()
  M.setup()
end

function M.health()
  local health = vim.health
  health.ok("UI module loaded")
end

return M
