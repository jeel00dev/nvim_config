-- plugins/explorer.lua — Neo-tree plugin registration
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle explorer" },
      { "<leader>E", "<cmd>Neotree focus<CR>", desc = "Focus explorer" },
      { "<C-n>", "<cmd>Neotree toggle<CR>", desc = "Toggle explorer" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("features.explorer").setup()
    end,
  },
}
