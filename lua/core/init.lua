-- core/init.lua — Bootstrap sequence
--
-- Purpose: Orchestrates the startup order.
-- 1. Options  →  2. Keymaps  →  3. Autocmds  →  4. Commands  →  5. Lazy

local M = {}

function M.setup()
  require("core.options")
  require("core.keymaps")
  require("core.autocmds")
  require("core.commands")
  require("core.lazy").setup()
end

return M
