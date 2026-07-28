-- plugins/dap.lua — DAP plugin registrations
return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", desc = "Toggle breakpoint" },
      { "<leader>dc", desc = "Continue" },
      { "<leader>dt", desc = "Toggle DAP UI" },
    },
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("features.debugger").setup()
      require("keymaps.dap")
    end,
  },
  { "rcarriga/nvim-dap-ui", lazy = true, dependencies = { "nvim-neotest/nvim-nio" } },
  { "theHamsta/nvim-dap-virtual-text", lazy = true },
  { "jay-babu/mason-nvim-dap.nvim", lazy = true, dependencies = { "williamboman/mason.nvim" } },
  { "nvim-neotest/nvim-nio", lazy = true },
}
