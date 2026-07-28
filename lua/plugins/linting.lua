-- plugins/linting.lua — nvim-lint plugin registration
return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost" },
    config = function()
      require("features.lint").setup()
    end,
  },
}
