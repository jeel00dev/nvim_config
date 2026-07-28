-- plugins/misc.lua — Miscellaneous plugin registrations
-- grug-far, bqf, sniprun, suda
return {
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = {
      { "<leader>sr", desc = "Search & replace" },
    },
    config = function()
      require("features.search-replace").setup()
      require("keymaps.editor")
      require("keymaps.explorer")
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = function()
      require("features.quickfix").setup()
    end,
  },
  {
    "michaelb/sniprun",
    build = "sh install.sh",
    cmd = { "SnipRun", "SnipInfo" },
    keys = {
      { "<leader>cr", desc = "Run code" },
    },
    config = function()
      require("features.runner").setup()
    end,
  },
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
    init = function()
      require("features.suda").setup()
    end,
  },
}
