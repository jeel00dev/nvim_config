-- features/search-replace/init.lua — Grug-far search and replace
-- Dependencies: grug-far.nvim
-- Exports: setup()

local M = {}

function M.setup()
  require("grug-far").setup({
    headerMaxWidth = 80,
    windowCreationCommand = "split",
  })
end

return M
