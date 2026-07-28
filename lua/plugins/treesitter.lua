-- plugins/treesitter.lua — Treesitter plugin registrations
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "andymass/vim-matchup",
    },
    config = function()
      require("features.treesitter").setup()
    end,
  },
  { "nvim-treesitter/nvim-treesitter-textobjects", lazy = true },
  {
    "windwp/nvim-ts-autotag",
    lazy = true,
    opts = {},
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = { enable_autocmd = false },
  },
  {
    "andymass/vim-matchup",
    lazy = true,
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
}
