-- plugins/edgy.lua — Edgy.nvim plugin registration
return {
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    config = function()
      require("features.edgy").setup()
    end,
  },
}
