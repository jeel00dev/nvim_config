-- features/navigation/init.lua — Flash.nvim jump navigation
-- Dependencies: flash.nvim
-- Exports: setup()

local M = {}

function M.setup()
  require("flash").setup({
    labels = "asdfghjklqwertyuiopzxcvbnm",
    search = { mode = "exact", incremental = true },
    label = { uppercase = false, rainbow = { enabled = true, shade = 5 } },
    modes = {
      char = { enabled = true },
      search = { enabled = false }, -- Don't hijack / search
    },
  })
end

return M
