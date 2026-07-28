-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  theme/highlights/dap.lua — Debug adapter highlight groups          ║
-- ╚══════════════════════════════════════════════════════════════════════╝

local palette = require("theme.palette")

return function()
  local hl = vim.api.nvim_set_hl

  hl(0, "DapBreakpoint", { fg = palette.red })
  hl(0, "DapBreakpointCondition", { fg = palette.orange })
  hl(0, "DapBreakpointRejected", { fg = palette.comment })
  hl(0, "DapLogPoint", { fg = palette.blue })
  hl(0, "DapStopped", { fg = palette.green, bg = "#1a2a1a" })
  hl(0, "DapStoppedLine", { bg = "#1a2a1a" })

  -- DAP UI
  hl(0, "DapUIVariable", { fg = palette.white })
  hl(0, "DapUIValue", { fg = palette.green })
  hl(0, "DapUIType", { fg = palette.blue })
  hl(0, "DapUIModifiedValue", { fg = palette.orange, bold = true })
  hl(0, "DapUIScope", { fg = palette.blue, bold = true })
  hl(0, "DapUIThread", { fg = palette.green })
  hl(0, "DapUIStoppedThread", { fg = palette.green, bold = true })
  hl(0, "DapUIFrameName", { fg = palette.white })
  hl(0, "DapUICurrentFrameName", { fg = palette.green, bold = true })
  hl(0, "DapUISource", { fg = palette.purple })
  hl(0, "DapUILineNumber", { fg = palette.blue })
  hl(0, "DapUIBreakpointsPath", { fg = palette.blue })
  hl(0, "DapUIBreakpointsInfo", { fg = palette.green })
  hl(0, "DapUIBreakpointsCurrentLine", { fg = palette.green, bold = true })
  hl(0, "DapUIWatchesEmpty", { fg = palette.comment })
  hl(0, "DapUIWatchesValue", { fg = palette.green })
  hl(0, "DapUIWatchesError", { fg = palette.red })
  hl(0, "DapUIDecoration", { fg = palette.blue })
  hl(0, "DapUIFloatBorder", { fg = palette.border, bg = palette.float_bg })
end
