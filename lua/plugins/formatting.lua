-- plugins/formatting.lua — Conform plugin registration
return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "ConformInfo" },
    config = function()
      require("features.formatter").setup()
    end,
  },
}
