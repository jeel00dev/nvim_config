-- features/ui/breadcrumbs.lua — Dropbar breadcrumbs configuration
--
-- Dependencies: dropbar.nvim
-- Exports: setup()

local M = {}

function M.setup()
  -- dropbar works out of the box with zero config.
  -- We only add keymaps for the picker.
  local utils = require("utils.functions")
  local ok, dropbar_api = pcall(require, "dropbar.api")
  if ok then
    utils.map("n", "<leader>;", dropbar_api.pick, "Pick breadcrumb symbol")
  end
end

return M
