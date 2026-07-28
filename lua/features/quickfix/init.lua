-- features/quickfix/init.lua — Enhanced quickfix list
-- Dependencies: nvim-bqf
-- Exports: setup()

local M = {}

function M.setup()
  require("bqf").setup({
    auto_enable = true,
    auto_resize_height = true,
    preview = {
      border = require("constants").border,
      winblend = 0,
    },
  })
end

return M
