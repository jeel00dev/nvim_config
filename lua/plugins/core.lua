-- plugins/core.lua — Core plugin registrations
-- Plugins: plenary.nvim, nui.nvim, nvim-web-devicons
-- These are dependencies used by many other plugins.
-- Registration only — no configuration logic here.

return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {
      default = true,
      strict = true,
    },
  },
}
