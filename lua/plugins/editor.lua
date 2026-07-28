-- plugins/editor.lua — Editing plugin registrations
return {
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      require("features.editor").setup()
    end,
  },
  {
    "m4xshen/autoclose.nvim",
    event = "InsertEnter",
  },
  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    version = false,
  },
  {
    "ibhagwan/smartyank.nvim",
    event = "VeryLazy",
    opts = {
      highlight = { enabled = false }, -- We use our own yank highlight
    },
  },
  {
    "tpope/vim-sleuth",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
