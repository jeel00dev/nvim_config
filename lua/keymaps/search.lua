-- keymaps/search.lua — Search keybindings (<leader>f)
local map = require("utils.functions").map
local picker = require("adapters.picker")

map("n", "<leader>ff", function() picker.find_files() end, "Find files")
map("n", "<leader>fg", function() picker.live_grep() end, "Live grep")
map("n", "<leader>fb", function() picker.buffers() end, "Buffers")
map("n", "<leader>fr", function() picker.oldfiles() end, "Recent files")
map("n", "<leader>fh", function() picker.help() end, "Help tags")
map("n", "<leader>fc", function() picker.commands() end, "Commands")
map("n", "<leader>fk", function() picker.keymaps() end, "Keymaps")
map("n", "<leader>f.", function() picker.resume() end, "Resume last search")

-- Show all keybinds via Ctrl-Shift-P
map({ "n", "i", "v" }, "<C-S-P>", function() picker.keymaps() end, "Show all keybinds")
map({ "n", "i", "v" }, "<C-S-p>", function() picker.keymaps() end, "Show all keybinds")
map("n", "<C-p>", function() picker.keymaps() end, "Show all keybinds")
map("n", "<C-P>", function() picker.keymaps() end, "Show all keybinds")
