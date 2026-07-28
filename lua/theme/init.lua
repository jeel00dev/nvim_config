-- theme/init.lua — Theme orchestrator
--
-- Purpose: Loads the colorscheme, then applies custom highlight overrides.
-- Exposes setup() and reload() for the dev commands system.
--
-- Dependencies: theme.highlights
-- Exports: setup(), reload()

local M = {}

--- Apply the theme: set colorscheme then apply custom highlights on top.
function M.setup()
  local config = require("config")
  local colorscheme = config.get("theme.colorscheme", "custom")

  -- Set background
  vim.o.background = config.get("theme.background", "dark")

  -- Apply colorscheme
  local ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
  if not ok then
    vim.cmd.colorscheme("default")
    require("theme.highlights").setup()
  end
end

--- Reload theme without restarting Neovim.
function M.reload()
  package.loaded["theme.highlights"] = nil
  package.loaded["theme.highlights.init"] = nil
  M.setup()
end

return M
