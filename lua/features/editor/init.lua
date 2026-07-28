-- features/editor/init.lua — Editing enhancements
-- Plugins: Comment, autoclose, mini.align, smartyank, vim-sleuth
-- Exports: setup()

local M = {}

function M.setup()
  -- Comment.nvim (gc to comment)
  require("Comment").setup({
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  })

  -- Autoclose brackets/quotes
  require("autoclose").setup({
    options = {
      disabled_filetypes = require("constants").filetypes.ui,
    },
  })

  -- Mini.align (ga to align)
  require("mini.align").setup()
end

return M
