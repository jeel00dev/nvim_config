-- keymaps/diagnostics.lua — Diagnostics keybindings (<leader>x)
local map = require("utils.functions").map

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", "Workspace diagnostics")
map("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", "Buffer diagnostics")
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", "Location list")
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", "Quickfix list")
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", "Document symbols")

-- Glance
map("n", "gD", "<cmd>Glance definitions<CR>", "Glance definition")
map("n", "gR", "<cmd>Glance references<CR>", "Glance references")
map("n", "gY", "<cmd>Glance type_definitions<CR>", "Glance type definition")
map("n", "gI", "<cmd>Glance implementations<CR>", "Glance implementations")
