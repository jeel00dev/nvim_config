-- keymaps/buffers.lua — Buffer management keybindings
--
-- Purpose: Buffer navigation and management under <leader>b

local map = require("utils.functions").map

map("n", "<leader>bb", "<cmd>BufferLinePick<CR>", "Pick buffer")
map("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", "Pick buffer to close")
map("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", "Toggle pin")
map("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", "Close unpinned")
map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", "Close other buffers")
map("n", "<leader>bl", "<cmd>BufferLineCloseRight<CR>", "Close buffers to the right")
map("n", "<leader>bh", "<cmd>BufferLineCloseLeft<CR>", "Close buffers to the left")
map("n", "<leader>bs", "<cmd>BufferLineSortByDirectory<CR>", "Sort by directory")
map("n", "<leader>be", "<cmd>BufferLineSortByExtension<CR>", "Sort by extension")
map("n", "<leader>bn", "<cmd>enew<CR>", "New buffer")

-- Backup buffer quick navigation (Alt keymaps)
map("n", "<A-q>", "<cmd>bdelete<CR>", "Close current buffer")
map("n", "<A-i>", "<cmd>BufferLineCycleNext<CR>", "Next buffer")
map("n", "<A-o>", "<cmd>BufferLineCyclePrev<CR>", "Previous buffer")
map("n", "<A-S-i>", "<cmd>BufferLineMoveNext<CR>", "Move buffer right")
map("n", "<A-S-o>", "<cmd>BufferLineMovePrev<CR>", "Move buffer left")

-- Go to specific buffer tabs
map("n", "<A-1>", "<cmd>BufferLineGoToBuffer 1<CR>", "Go to buffer 1")
map("n", "<A-2>", "<cmd>BufferLineGoToBuffer 2<CR>", "Go to buffer 2")
map("n", "<A-3>", "<cmd>BufferLineGoToBuffer 3<CR>", "Go to buffer 3")
map("n", "<A-4>", "<cmd>BufferLineGoToBuffer 4<CR>", "Go to buffer 4")
map("n", "<A-5>", "<cmd>BufferLineGoToBuffer 5<CR>", "Go to buffer 5")
map("n", "<A-6>", "<cmd>BufferLineGoToBuffer 6<CR>", "Go to buffer 6")
map("n", "<A-7>", "<cmd>BufferLineGoToBuffer 7<CR>", "Go to buffer 7")
map("n", "<A-8>", "<cmd>BufferLineGoToBuffer 8<CR>", "Go to buffer 8")
map("n", "<A-9>", "<cmd>BufferLineGoToBuffer 9<CR>", "Go to buffer 9")
