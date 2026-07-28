-- adapters/git.lua — Git abstraction
--
-- Purpose: Thin wrapper over gitsigns for features that need git info
-- without coupling directly to the plugin.

local M = {}

function M.blame_line()
  require("gitsigns").blame_line({ full = true })
end

function M.preview_hunk()
  require("gitsigns").preview_hunk()
end

function M.next_hunk()
  require("gitsigns").nav_hunk("next")
end

function M.prev_hunk()
  require("gitsigns").nav_hunk("prev")
end

function M.stage_hunk()
  require("gitsigns").stage_hunk()
end

function M.reset_hunk()
  require("gitsigns").reset_hunk()
end

function M.diff_this()
  require("gitsigns").diffthis()
end

return M
