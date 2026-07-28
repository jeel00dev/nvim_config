-- features/ui/rainbow.lua — Rainbow delimiters configuration
-- Dependencies: rainbow-delimiters.nvim
-- Exports: setup()

local M = {}

function M.setup()
  local palette = require("theme.palette")
  local rainbow = require("rainbow-delimiters")

  vim.g.rainbow_delimiters = {
    strategy = {
      [""] = rainbow.strategy["global"],
      vim = rainbow.strategy["local"],
    },
    query = {
      [""] = "rainbow-delimiters",
      lua = "rainbow-blocks",
    },
    highlight = {
      "RainbowDelimiterBlue",
      "RainbowDelimiterOrange",
      "RainbowDelimiterGreen",
      "RainbowDelimiterPurple",
      "RainbowDelimiterRed",
      "RainbowDelimiterBrown",
    },
  }

  -- Set rainbow colors from palette
  local hl = vim.api.nvim_set_hl
  hl(0, "RainbowDelimiterBlue", { fg = palette.blue })
  hl(0, "RainbowDelimiterOrange", { fg = palette.orange })
  hl(0, "RainbowDelimiterGreen", { fg = palette.green })
  hl(0, "RainbowDelimiterPurple", { fg = palette.purple })
  hl(0, "RainbowDelimiterRed", { fg = palette.red })
  hl(0, "RainbowDelimiterBrown", { fg = palette.brown })
end

return M
