-- features/ui/indentline.lua — Indent guides configuration
--
-- Dependencies: indent-blankline.nvim
-- Exports: setup()

local M = {}

function M.setup()
  local constants = require("constants")

  require("ibl").setup({
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
    },
    exclude = {
      filetypes = constants.filetypes.ui,
      buftypes = { "terminal", "nofile" },
    },
  })
end

return M
