-- plugins/terminal.lua — Terminal plugin registration
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<leader>tt", desc = "Float terminal" },
      { "<leader>th", desc = "Horizontal terminal" },
      { "<leader>tv", desc = "Vertical terminal" },
      { "<leader>tg", desc = "Lazygit" },
    },
    config = function()
      require("features.terminal").setup()
      require("keymaps.terminal")
    end,
  },
}
