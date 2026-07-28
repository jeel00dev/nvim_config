-- plugins/diagnostics.lua — Diagnostics plugin registrations
return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", desc = "Workspace diagnostics" },
      { "<leader>xd", desc = "Buffer diagnostics" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("features.diagnostics").setup()
      require("keymaps.diagnostics")
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
  },
  {
    "dnlhc/glance.nvim",
    cmd = "Glance",
    event = "LspAttach",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
  },
}
