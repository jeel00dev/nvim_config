-- colors/custom.lua — Custom colorscheme definition
--
-- Purpose: Defines the custom colorscheme "custom" by inheriting from
-- catppuccin (which has our custom color_overrides) and then applying overrides.
-- This ensures all plugins (Lualine, Neotree, etc.) are fully and beautifully themed.

-- Load catppuccin mocha as our base theme
local ok, _ = pcall(vim.cmd.colorscheme, "catppuccin-mocha")

-- Set name to custom so Neovim/User sees "custom"
vim.g.colors_name = "custom"
vim.o.background = "dark"

-- Apply our custom highlights
require("theme.highlights").setup()
