-- keymaps/ai.lua — AI keybindings
local map = require("utils.functions").map

-- These keymaps are available globally but only do something
-- when the AI provider is active.
map("n", "<leader>ae", function()
  local config = require("config")
  local current = config.get("ai.enabled", true)
  -- Toggle would require config mutation; for now just inform
  vim.notify("AI is " .. (current and "enabled" or "disabled"), vim.log.levels.INFO, { title = "AI" })
end, "AI status")
