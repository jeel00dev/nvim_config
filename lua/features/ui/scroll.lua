-- features/ui/scroll.lua — Smooth scrolling
-- Dependencies: neoscroll.nvim
-- Exports: setup()

local M = {}

function M.setup()
  require("neoscroll").setup({
    mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
    hide_cursor = true,
    stop_eof = false,
    respect_scrolloff = false,
    cursor_scrolls_alone = true,
    easing = "quadratic",
    pre_hook = nil,
    post_hook = nil,
    performance_mode = false,
  })
end

return M
