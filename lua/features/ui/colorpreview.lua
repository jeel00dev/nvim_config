-- features/ui/colorpreview.lua — Inline color preview
-- Dependencies: nvim-highlight-colors
-- Exports: setup()

local M = {}

function M.setup()
  require("nvim-highlight-colors").setup({
    render = "virtual",
    virtual_symbol = "●",
    enable_named_colors = true,
    enable_tailwind = false,
  })
end

return M
