-- features/edgy/init.lua — Window layout management
--
-- Purpose: Organizes side panels and bottom panels into consistent positions.
-- Dependencies: edgy.nvim
-- Exports: setup()

local M = {}

function M.setup()
  local constants = require("constants")

  require("edgy").setup({
    animate = { enabled = false },
    wo = {
      winbar = false,
    },
    left = {
      {
        title = "Explorer",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        pinned = true,
        open = "Neotree filesystem",
        size = { width = constants.window.sidebar_width },
      },
      {
        title = "Git Status",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "git_status"
        end,
        pinned = false,
        open = "Neotree git_status",
      },
      {
        title = "Buffers",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "buffers"
        end,
        pinned = false,
        open = "Neotree buffers",
      },
    },
    bottom = {
      {
        ft = "trouble",
        title = "Diagnostics",
        filter = function(_, win)
          return vim.w[win].trouble
            and vim.w[win].trouble.mode
            and vim.w[win].trouble.mode == "diagnostics"
        end,
        size = { height = 0.3 },
      },
      {
        ft = "toggleterm",
        title = "Terminal",
        size = { height = 0.3 },
        filter = function(buf)
          return not vim.b[buf].lazyterm_cmd
        end,
      },
      { ft = "qf", title = "Quickfix" },
      { ft = "help", title = "Help", size = { height = 0.4 } },
    },
    right = {
      {
        title = "DAP Scopes",
        ft = "dapui_scopes",
        size = { width = 40 },
      },
      {
        title = "DAP Breakpoints",
        ft = "dapui_breakpoints",
        size = { width = 40 },
      },
      {
        title = "DAP Stacks",
        ft = "dapui_stacks",
        size = { width = 40 },
      },
      {
        title = "DAP Watches",
        ft = "dapui_watches",
        size = { width = 40 },
      },
    },
  })
end

return M
