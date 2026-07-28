-- plugins/colorscheme.lua — Theme plugin registrations
-- Plugins: catppuccin, lush.nvim
-- Registration only — theme logic lives in theme/

return {
  {
    "catppuccin/nvim",
    lazy = false, -- Load immediately (colorscheme must be available at startup)
    priority = 1000, -- Load before all other plugins
    config = function()
      local palette = require("theme.palette")
      require("catppuccin").setup({
        flavour = require("config").get("theme.variant", "mocha"),
        transparent_background = require("config").get("ui.transparency", false),
        no_italic = false,
        no_bold = false,
        color_overrides = {
          all = {
            text = palette.white,
            subtext1 = palette.quartz,
            subtext0 = palette.white,
            overlay2 = palette.comment,
            overlay1 = palette.comment,
            overlay0 = palette.line_nr,
            surface2 = palette.bg5,
            surface1 = palette.bg4,
            surface0 = palette.bg3,
            base = palette.bg,
            mantle = palette.bg2,
            crust = palette.bg2,
            red = palette.red,
            green = palette.green,
            yellow = palette.orange,
            blue = palette.blue,
            rosewater = palette.quartz,
            flamingo = palette.red,
            pink = palette.purple,
            mauve = palette.purple,
            peach = palette.orangebg,
            teal = palette.green,
            sky = palette.blue,
            sapphire = palette.blue,
            lavender = palette.quartz,
          },
        },
        compile = {
          enabled = false,
        },
        integrations = {
          alpha = true,
          cmp = true,
          gitsigns = true,
          indent_blankline = { enabled = true },
          mason = true,
          native_lsp = { enabled = true },
          neotree = true,
          noice = true,
          notify = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
      })
      -- Apply theme (colorscheme + custom highlights)
      require("theme").setup()
    end,
  },
  {
    "rktjmp/lush.nvim",
    lazy = true, -- Only needed when developing custom themes
    cmd = { "Lushify", "LushRunTutorial" },
  },
}
