-- plugins/ui.lua — UI plugin registrations
-- Registration only — configuration logic lives in features/ui/

return {
  -- Dashboard
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("features.ui.dashboard").setup()
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("features.ui.statusline").setup()
    end,
  },

  -- Buffer tabs
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("features.ui.bufferline").setup()
      require("keymaps.buffers")
    end,
  },

  -- Notifications
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("features.ui.notify").setup()
    end,
  },

  -- Command line & popups
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("features.ui.noice").setup()
    end,
  },

  -- Breadcrumbs
  {
    "Bekaboo/dropbar.nvim",
    event = "BufReadPost",
    config = function()
      require("features.ui.breadcrumbs").setup()
    end,
  },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require("features.ui.scroll").setup()
    end,
  },

  -- Smooth cursor
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
