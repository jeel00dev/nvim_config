-- features/whichkey/init.lua — Which-key configuration
--
-- Purpose: Keybinding popup with group registrations for all leader categories.
-- Dependencies: which-key.nvim
-- Exports: setup()

local M = {}

function M.setup()
  local wk = require("which-key")
  local icons = require("theme.icons")

  wk.setup({
    plugins = {
      marks = true,
      registers = true,
      spelling = { enabled = true, suggestions = 20 },
    },
    win = {
      border = require("constants").border,
      padding = { 1, 2 },
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
    },
    icons = {
      breadcrumb = "»",
      separator = "→",
      group = " ",
    },
    show_help = true,
    show_keys = true,
  })

  -- Register leader key groups
  wk.add({
    { "<leader>b", group = "Buffers", icon = "" },
    { "<leader>c", group = "Code", icon = "" },
    { "<leader>d", group = "Debug", icon = "" },
    { "<leader>f", group = "Find", icon = "" },
    { "<leader>g", group = "Git", icon = "" },
    { "<leader>l", group = "LSP", icon = "" },
    { "<leader>p", group = "Projects", icon = "" },
    { "<leader>q", group = "Quit", icon = "󰗼" },
    { "<leader>s", group = "Search/Replace", icon = "" },
    { "<leader>t", group = "Terminal", icon = "" },
    { "<leader>w", group = "Windows", icon = "" },
    { "<leader>x", group = "Diagnostics", icon = "" },
  })
end

return M
