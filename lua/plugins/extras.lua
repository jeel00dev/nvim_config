-- plugins/extras.lua — UI extras plugin registrations
-- Registration only — configuration logic lives in features/ui/

return {
  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPost",
    config = function()
      require("features.ui.indentline").setup()
    end,
  },

  -- Rainbow delimiters
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      require("features.ui.rainbow").setup()
    end,
  },

  -- Sticky context
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("features.ui.context").setup()
    end,
  },

  -- Color preview
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPost",
    config = function()
      require("features.ui.colorpreview").setup()
    end,
  },

  -- Scrollbar
  {
    "dstein64/nvim-scrollview",
    event = "BufReadPost",
    config = function()
      require("features.ui.scrollbar").setup()
    end,
  },
}
