-- keymaps/explorer.lua — Explorer keybindings
-- Note: Primary keymaps (<leader>e, <leader>E) are defined in plugins/explorer.lua
-- via lazy.nvim keys for proper lazy-loading. This file is for additional mappings.

local map = require("utils.functions").map

map("n", "<leader>eb", "<cmd>Neotree buffers toggle<CR>", "Buffer explorer")
map("n", "<leader>eg", "<cmd>Neotree git_status toggle<CR>", "Git status explorer")
map("n", "<C-n>", "<cmd>Neotree toggle<CR>", "Toggle explorer")
