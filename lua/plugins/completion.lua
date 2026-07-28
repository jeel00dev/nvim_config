-- plugins/completion.lua — Completion plugin registrations
return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("features.completion").setup()
    end,
  },
}
