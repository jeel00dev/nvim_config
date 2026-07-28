-- keymaps/core.lua — Core keybindings (non-plugin)
--
-- Purpose: Essential editor keymaps that don't depend on any plugin.
-- Includes: window navigation, buffer switching, save, escape, resize.

local map = require("utils.functions").map

-- Better window navigation
map("n", "<C-h>", "<C-w>h", "Move to left window")
map("n", "<C-j>", "<C-w>j", "Move to lower window")
map("n", "<C-k>", "<C-w>k", "Move to upper window")
map("n", "<C-l>", "<C-w>l", "Move to right window")

-- Resize windows with arrows
map("n", "<C-Up>", "<cmd>resize +2<CR>", "Increase window height")
map("n", "<C-Down>", "<cmd>resize -2<CR>", "Decrease window height")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", "Decrease window width")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", "Increase window width")

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<CR>", "Previous buffer")
map("n", "<S-l>", "<cmd>bnext<CR>", "Next buffer")
map("n", "<leader>bd", "<cmd>bdelete<CR>", "Delete buffer")
map("n", "<leader>bD", "<cmd>bdelete!<CR>", "Force delete buffer")

-- Better escape
map("i", "jk", "<Esc>", "Escape insert mode")
map("i", "kj", "<Esc>", "Escape insert mode")

-- Clear search highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlights")

-- Save
map("n", "<C-s>", "<cmd>w<CR>", "Save file")
map("i", "<C-s>", "<Esc><cmd>w<CR>", "Save file")
map("v", "<C-s>", "<Esc><cmd>w<CR>", "Save file")

-- Move lines up/down
map("n", "<A-j>", "<cmd>m .+1<CR>==", "Move line down")
map("n", "<A-k>", "<cmd>m .-2<CR>==", "Move line up")
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move selection up")

-- Better indenting (stay in visual mode)
map("v", "<", "<gv", "Indent left")
map("v", ">", ">gv", "Indent right")

-- Paste without yanking in visual mode
map("v", "p", '"_dP', "Paste without yanking")

-- Center cursor after jumps
map("n", "<C-d>", "<C-d>zz", "Scroll down half-page (centered)")
map("n", "<C-u>", "<C-u>zz", "Scroll up half-page (centered)")
map("n", "<C-f>", "<C-f>zz", "Scroll down full-page (centered)")
map("n", "<C-b>", "<C-b>zz", "Scroll up full-page (centered)")
map("n", "<PageDown>", "<PageDown>zz", "Page down (centered)")
map("n", "<PageUp>", "<PageUp>zz", "Page up (centered)")
map("n", "gg", "ggzz", "Go to top of file (centered)")
map("n", "G", "Gzz", "Go to bottom of file (centered)")
map("n", "n", "nzzzv", "Next search result (centered)")
map("n", "N", "Nzzzv", "Prev search result (centered)")

-- Quick quit
map("n", "<leader>qq", "<cmd>qa<CR>", "Quit all")

-- Windows
map("n", "<leader>wv", "<cmd>vsplit<CR>", "Vertical split")
map("n", "<leader>wh", "<cmd>split<CR>", "Horizontal split")
map("n", "<leader>wc", "<cmd>close<CR>", "Close window")
map("n", "<leader>wo", "<cmd>only<CR>", "Close other windows")

-- Backup keymaps: Save & Quit
map("n", "<C-q>", "<cmd>wq<CR>", "Save and quit")
map("n", "<A-S-q>", "<cmd>q!<CR>", "Force quit")
map("i", "<C-q>", "<Esc><cmd>wq<CR>", "Save and quit")

-- Backup keymaps: Insert mode editing/navigation
map("i", "<C-u>", "<C-G>u<C-U>", "Delete previous block")
map("i", "<C-b>", "<Left>", "Move cursor left")
map("i", "<C-a>", "<Esc>^i", "Move cursor to line start")

-- Backup keymaps: Command mode editing/navigation
map("c", "<C-b>", "<Left>", "Move cursor left")
map("c", "<C-f>", "<Right>", "Move cursor right")
map("c", "<C-a>", "<Home>", "Move cursor to start")
map("c", "<C-e>", "<End>", "Move cursor to end")
map("c", "<C-d>", "<Del>", "Delete character")
map("c", "<C-h>", "<BS>", "Backspace")
map("c", "<C-t>", [[<C-R>=expand("%:p:h") . "/" <CR>]], "Complete path of current file")

-- Backup keymaps: Visual line movement with J/K
map("v", "J", ":m '>+1<CR>gv=gv", "Move selection down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move selection up")

-- Backup keymaps: Suckless & utility keys
map("n", "Y", "y$", "Yank to EOL")
map("n", "D", "d$", "Delete to EOL")
map("n", "J", "mzJ`z", "Join next line")
map("n", "<S-Tab>", "za", "Toggle code fold")
map("n", "<leader>o", "<cmd>setlocal spell! spelllang=en_us<CR>", "Toggle spell check")

-- Backup keymaps: Very magic search
map("n", "/", "/\\v", "Very magic search")

