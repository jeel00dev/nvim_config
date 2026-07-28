-- plugins/whichkey.lua — Which-key plugin registration
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("features.whichkey").setup()
    end,
  },
}
