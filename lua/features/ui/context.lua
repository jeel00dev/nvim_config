-- features/ui/context.lua — Treesitter context (sticky header)
-- Dependencies: nvim-treesitter-context
-- Exports: setup()

local M = {}

function M.setup()
  require("treesitter-context").setup({
    enable = true,
    max_lines = 3,
    min_window_height = 20,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = "outer",
    mode = "cursor",
    separator = nil,
  })
end

return M
