-- keymaps/terminal.lua — Terminal keybindings (<leader>t)
local map = require("utils.functions").map

map("n", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", "Float terminal")
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", "Horizontal terminal")
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", "Vertical terminal")
map("n", "<leader>tg", function() require("features.terminal").lazygit() end, "Lazygit")

-- Terminal mode escape
map("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")
map("t", "<C-h>", "<C-\\><C-n><C-w>h", "Terminal: move left")
map("t", "<C-j>", "<C-\\><C-n><C-w>j", "Terminal: move down")
map("t", "<C-k>", "<C-\\><C-n><C-w>k", "Terminal: move up")
map("t", "<C-l>", "<C-\\><C-n><C-w>l", "Terminal: move right")

-- Backup ToggleTerm convenience mappings
map("n", "<C-\\>", "<cmd>ToggleTerm direction=horizontal<CR>", "Toggle horizontal terminal")
map("i", "<C-\\>", "<Esc><cmd>ToggleTerm direction=horizontal<CR>", "Toggle horizontal terminal")
map("t", "<C-\\>", "<Cmd>ToggleTerm<CR>", "Toggle horizontal terminal")

map("n", "<A-\\>", "<cmd>ToggleTerm direction=vertical<CR>", "Toggle vertical terminal")
map("i", "<A-\\>", "<Esc><cmd>ToggleTerm direction=vertical<CR>", "Toggle vertical terminal")
map("t", "<A-\\>", "<Cmd>ToggleTerm<CR>", "Toggle vertical terminal")

map("n", "<F5>", "<cmd>ToggleTerm direction=vertical<CR>", "Toggle vertical terminal")
map("i", "<F5>", "<Esc><cmd>ToggleTerm direction=vertical<CR>", "Toggle vertical terminal")
map("t", "<F5>", "<Cmd>ToggleTerm<CR>", "Toggle vertical terminal")

map("n", "<A-d>", "<cmd>ToggleTerm direction=float<CR>", "Toggle float terminal")
map("i", "<A-d>", "<Esc><cmd>ToggleTerm direction=float<CR>", "Toggle float terminal")
map("t", "<A-d>", "<Cmd>ToggleTerm<CR>", "Toggle float terminal")
