-- features/suda/init.lua — Protected file editing
-- Dependencies: suda.vim
-- Exports: setup()

local M = {}

function M.setup()
  -- suda.vim uses SudaRead and SudaWrite commands
  -- No additional setup needed; commands are available automatically.
  vim.g.suda_smart_edit = 1
end

return M
