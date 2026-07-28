-- features/runner/init.lua — Code runner (sniprun)
-- Dependencies: sniprun
-- Exports: setup()

local M = {}

function M.setup()
  require("sniprun").setup({
    display = { "NvimNotify" },
    show_no_output = { "NvimNotify" },
    borders = require("constants").border,
  })
end

return M
