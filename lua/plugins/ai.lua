-- plugins/ai.lua — AI plugin registrations
-- Only loads when NVIM_AI=1 environment variable is set (via `vai` alias)
local ai_enabled = vim.env.NVIM_AI == "1"

return {
  {
    "milanglacier/minuet-ai.nvim",
    cond = ai_enabled,
    lazy = false,
    config = function()
      require("features.ai").setup()
      require("keymaps.ai")
    end,
  },
}
