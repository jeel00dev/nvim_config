-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  theme/highlights/git.lua — Git sign & diff highlight groups        ║
-- ╚══════════════════════════════════════════════════════════════════════╝

local palette = require("theme.palette")

return function()
  local hl = vim.api.nvim_set_hl

  hl(0, "GitSignsAdd", { fg = palette.added, bg = palette.bg })
  hl(0, "GitSignsChange", { fg = palette.changed, bg = palette.bg })
  hl(0, "GitSignsDelete", { fg = palette.removed, bg = palette.bg })
  hl(0, "GitSignsAddNr", { fg = palette.added })
  hl(0, "GitSignsChangeNr", { fg = palette.changed })
  hl(0, "GitSignsDeleteNr", { fg = palette.removed })
  hl(0, "GitSignsAddLn", { bg = "#1c4c23" })
  hl(0, "GitSignsChangeLn", { bg = "#143542" })
  hl(0, "GitSignsDeleteLn", { bg = "#632323" })
  hl(0, "GitSignsCurrentLineBlame", { fg = palette.comment, italic = true })
end
