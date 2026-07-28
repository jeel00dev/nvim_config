-- features/git/init.lua — Git integration
--
-- Purpose: Gitsigns, diffview, gitgraph configuration.
-- Dependencies: gitsigns.nvim, diffview.nvim, gitgraph.nvim
-- Exports: setup()

local M = {}

function M.setup()
  local icons = require("theme.icons")
  local palette = require("theme.palette")
  local config = require("config")

  -- Gitsigns
  require("gitsigns").setup({
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged_enable = true,
    current_line_blame = config.get("git.current_line_blame", false),
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 300,
    },
    current_line_blame_formatter = "  <author>, <author_time:%R> — <summary>",
    preview_config = {
      border = require("constants").border,
      style = "minimal",
    },
    on_attach = function(bufnr)
      require("keymaps.git").on_attach(bufnr)
    end,
  })

  -- Diffview
  require("diffview").setup({
    enhanced_diff_hl = true,
    view = {
      default = { layout = "diff2_horizontal" },
      merge_tool = { layout = "diff3_horizontal" },
    },
    file_panel = {
      listing_style = "tree",
      win_config = { position = "left", width = 35 },
    },
  })
end

return M
