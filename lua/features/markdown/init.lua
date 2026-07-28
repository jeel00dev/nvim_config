-- features/markdown/init.lua — Markdown rendering and preview
-- Dependencies: render-markdown.nvim, markdown-preview.nvim
-- Exports: setup()

local M = {}

function M.setup()
  require("render-markdown").setup({
    heading = {
      enabled = true,
      sign = true,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    },
    code = {
      enabled = true,
      sign = false,
      style = "full",
      left_pad = 1,
      right_pad = 1,
    },
    bullet = {
      enabled = true,
      icons = { "●", "○", "◆", "◇" },
    },
    checkbox = {
      enabled = true,
      unchecked = { icon = "☐ " },
      checked = { icon = "☑ " },
    },
    pipe_table = { enabled = true, style = "full" },
  })
end

return M
