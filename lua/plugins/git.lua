-- plugins/git.lua — Git plugin registrations
return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("features.git").setup()
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
    keys = {
      { "<leader>gd", desc = "Git diff" },
      { "<leader>gh", desc = "File history" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "isakbm/gitgraph.nvim",
    keys = {
      { "<leader>gg", desc = "Git graph" },
    },
    dependencies = { "sindrets/diffview.nvim" },
    opts = {},
  },
}
