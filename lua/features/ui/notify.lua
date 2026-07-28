-- features/ui/notify.lua — nvim-notify configuration
--
-- Purpose: Clean notification popups with custom palette styling.
-- Dependencies: nvim-notify
-- Exports: setup()

local M = {}

function M.setup()
  local palette = require("theme.palette")
  local constants = require("constants")

  require("notify").setup({
    background_colour = palette.float_bg,
    fps = 60,
    level = vim.log.levels.INFO,
    minimum_width = 30,
    max_width = 60,
    max_height = 10,
    render = "wrapped-compact",
    stages = "fade",
    timeout = constants.timeouts.notification,
    top_down = true,
    icons = {
      ERROR = require("theme.icons").diagnostics.error,
      WARN = require("theme.icons").diagnostics.warn,
      INFO = require("theme.icons").diagnostics.info,
      DEBUG = require("theme.icons").diagnostics.hint,
      TRACE = "✎",
    },
  })

  -- Set as default notify handler
  vim.notify = require("notify")
end

return M
