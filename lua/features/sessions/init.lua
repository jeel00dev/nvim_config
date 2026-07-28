-- features/sessions/init.lua — Session management
-- Dependencies: persisted.nvim
-- Exports: setup()

local M = {}

function M.setup()
  require("persisted").setup({
    save_dir = vim.fn.stdpath("data") .. "/sessions/",
    autoload = false,
    autosave = true,
    on_autoload_no_session = function() end,
    use_git_branch = true,
    should_save = function()
      -- Don't save sessions for certain filetypes
      if vim.bo.filetype == "alpha" then
        return false
      end
      return true
    end,
  })
end

return M
