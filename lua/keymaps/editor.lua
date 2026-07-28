-- keymaps/editor.lua — Editor & misc keybindings
local map = require("utils.functions").map

-- Search & replace (<leader>s)
map("n", "<leader>sr", function() require("grug-far").open() end, "Search & replace")
map("v", "<leader>sr", function()
  require("grug-far").with_visual_selection()
end, "Search & replace (selection)")

-- Code actions (<leader>c)
map("n", "<leader>cr", function() require("sniprun").run() end, "Run code")
map("v", "<leader>cr", function() require("sniprun").run("v") end, "Run selection")
map("n", "<leader>cR", function() require("sniprun").reset() end, "Reset runner")

-- Todo comments
map("n", "<leader>ct", "<cmd>TodoTrouble<CR>", "Todo list")
map("n", "]t", function() require("todo-comments").jump_next() end, "Next todo")
map("n", "[t", function() require("todo-comments").jump_prev() end, "Previous todo")

-- Sessions
map("n", "<leader>ps", "<cmd>SessionLoad<CR>", "Load session")
map("n", "<leader>pS", "<cmd>SessionSave<CR>", "Save session")
map("n", "<leader>ss", "<cmd>SessionSave<CR>", "Save session")
map("n", "<leader>sl", "<cmd>SessionLoad<CR>", "Load session")
map("n", "<leader>sd", "<cmd>SessionDelete<CR>", "Delete session")

-- Markdown
map("n", "<F1>", "<cmd>RenderMarkdown toggle<CR>", "Toggle markdown rendering")
map("n", "<F12>", "<cmd>MarkdownPreviewToggle<CR>", "Toggle markdown preview")

-- Treesitter Textobjects: Select (visual / operator pending modes)
map({ "x", "o" }, "af", function() require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects") end, "Select outer function")
map({ "x", "o" }, "if", function() require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects") end, "Select inner function")
map({ "x", "o" }, "ac", function() require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects") end, "Select outer class")
map({ "x", "o" }, "ic", function() require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects") end, "Select inner class")

-- Treesitter Textobjects: Swap (normal mode)
map("n", "<leader>a", function() require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner") end, "Swap parameter inner next")
map("n", "<leader>A", function() require("nvim-treesitter-textobjects.swap").swap_next("@parameter.outer") end, "Swap parameter outer next")

-- Treesitter Textobjects: Move (normal / visual / operator pending modes)
map({ "n", "x", "o" }, "][", function() require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects") end, "Go to next function start")
map({ "n", "x", "o" }, "]]", function() require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects") end, "Go to next function end")
map({ "n", "x", "o" }, "]m", function() require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects") end, "Go to next class start")
map({ "n", "x", "o" }, "]M", function() require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects") end, "Go to next class end")

map({ "n", "x", "o" }, "[[", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects") end, "Go to previous function start")
map({ "n", "x", "o" }, "[]", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects") end, "Go to previous function end")
map({ "n", "x", "o" }, "[m", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects") end, "Go to previous class start")
map({ "n", "x", "o" }, "[M", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects") end, "Go to previous class end")

-- Repeat movement
map({ "n", "x", "o" }, ";", function() require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_next() end, "Repeat last move")
