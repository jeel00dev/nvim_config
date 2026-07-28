-- keymaps/git.lua — Git keybindings (<leader>g)
--
-- Purpose: Buffer-local git keymaps set when gitsigns attaches,
-- plus global keymaps for diffview and gitgraph.

local M = {}
local map = require("utils.functions").map

--- Called from gitsigns on_attach. Sets buffer-local hunk keymaps.
---@param bufnr integer
function M.on_attach(bufnr)
  local gs = require("gitsigns")
  local bmap = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
  end

  -- Hunk navigation
  bmap("n", "]h", function() gs.nav_hunk("next") end, "Next git hunk")
  bmap("n", "[h", function() gs.nav_hunk("prev") end, "Previous git hunk")
  bmap("n", "]g", function() gs.nav_hunk("next") end, "Next git hunk")
  bmap("n", "[g", function() gs.nav_hunk("prev") end, "Previous git hunk")

  -- Hunk actions
  bmap("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
  bmap("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage hunk")
  bmap("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
  bmap("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset hunk")
  bmap("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
  bmap("n", "<leader>gu", gs.undo_stage_hunk, "Undo stage hunk")
  bmap("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
  bmap("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
  bmap("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
  bmap("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle line blame")
  bmap({"o", "x"}, "ih", gs.select_hunk, "Select hunk")
end

-- Global git keymaps (not buffer-local)
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", "Git diff")
map("n", "<leader>gD", "<cmd>DiffviewClose<CR>", "Close diffview")
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", "File history")
map("n", "<leader>gH", "<cmd>DiffviewFileHistory<CR>", "Branch history")
map("n", "<leader>gc", "<cmd>DiffviewClose<CR>", "Close diffview")
map("n", "<leader>gg", function()
  require("gitgraph").draw({}, { all = true, size = 16 })
end, "Git graph")

return M
