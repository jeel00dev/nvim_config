-- features/terminal/init.lua — Toggleterm configuration
-- Exports: setup()

local M = {}

function M.setup()
  local palette = require("theme.palette")
  local constants = require("constants")

  require("toggleterm").setup({
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = nil, -- We use keymaps instead
    hide_numbers = true,
    shade_terminals = false,
    start_in_insert = true,
    insert_mappings = false,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = constants.border,
      width = math.floor(vim.o.columns * 0.8),
      height = math.floor(vim.o.lines * 0.8),
      winblend = 0,
    },
    highlights = {
      Normal = { guibg = palette.bg },
      NormalFloat = { guibg = palette.float_bg },
      FloatBorder = { guifg = palette.border, guibg = palette.float_bg },
    },
  })
end

--- Create a lazygit terminal instance.
function M.lazygit()
  local Terminal = require("toggleterm.terminal").Terminal
  local lg = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
      border = require("constants").border,
      width = math.floor(vim.o.columns * 0.9),
      height = math.floor(vim.o.lines * 0.9),
    },
  })
  lg:toggle()
end

return M
