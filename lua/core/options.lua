-- core/options.lua — Neovim editor options
--
-- Purpose: Sets all vim.opt values. Reads from config/defaults.lua.
-- Dependencies: config

local config = require("config")

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = config.get("ui.relative_numbers", true)

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- UI
opt.termguicolors = true
opt.signcolumn = config.get("ui.signcolumn", "yes")
opt.cursorline = config.get("ui.cursorline", true)
opt.scrolloff = 999
opt.sidescrolloff = config.get("ui.sidescrolloff", 8)
opt.showmode = false -- lualine handles this
opt.cmdheight = 0 -- noice handles the cmdline
opt.pumheight = 12 -- completion menu max items
opt.pumblend = 0 -- opaque popup menu
opt.winblend = 0 -- opaque floating windows
opt.laststatus = 3 -- global statusline (required for edgy.nvim)

-- Splits
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = "screen" -- stable splits (required for edgy.nvim)

-- Wrapping
opt.wrap = true
opt.linebreak = true
opt.showbreak = "↳ "
opt.breakindent = true
opt.breakindentopt = "shift:2"
opt.sidescroll = 1
opt.sidescrolloff = 5

-- Undo & backup
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Clipboard
opt.clipboard = "unnamedplus"

-- Performance
local constants = require("constants")
opt.updatetime = constants.timeouts.updatetime
opt.timeoutlen = constants.timeouts.timeoutlen

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }
opt.shortmess:append("c") -- suppress completion messages

-- Misc
opt.mouse = "a"
opt.mousemoveevent = true -- dropbar.nvim needs this
opt.fillchars = {
  eob = " ", -- hide ~ at end of buffer
  fold = " ",
  foldopen = "▾",
  foldclose = "▸",
  foldsep = " ",
  diff = "╱",
  vert = "│",
}
opt.list = true
opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }
opt.conceallevel = 2 -- for render-markdown.nvim
opt.confirm = true -- ask to save on quit
opt.iskeyword:append("-") -- treat dash-separated words as one word
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" }
