-- features/ui/scrollbar.lua — Scrollbar with markers
-- Dependencies: nvim-scrollview
-- Exports: setup()

local M = {}

function M.setup()
  local palette = require("theme.palette")

  require("scrollview").setup({
    excluded_filetypes = require("constants").filetypes.ui,
    current_only = true,
    base = "right",
    column = 1,
    signs_on_startup = { "diagnostics", "search", "cursor" },
    diagnostics_error_symbol = "▐",
    diagnostics_warn_symbol = "▐",
    diagnostics_info_symbol = "▐",
    diagnostics_hint_symbol = "▐",
  })

  -- Style scrollbar with palette
  local hl = vim.api.nvim_set_hl
  hl(0, "ScrollView", { bg = palette.bg4 })
  hl(0, "ScrollViewDiagnosticsError", { fg = palette.error })
  hl(0, "ScrollViewDiagnosticsWarn", { fg = palette.warn })
  hl(0, "ScrollViewDiagnosticsInfo", { fg = palette.info })
  hl(0, "ScrollViewDiagnosticsHint", { fg = palette.hint })
  hl(0, "ScrollViewSearch", { fg = palette.orange })
  -- Refresh scrollview on CursorMoved to update the scrollbar and cursor marker constantly.
  -- We debounce the refresh using a timer to avoid lag during fast scrolling (e.g. Ctrl-d/u via neoscroll).
  local uv = vim.uv or vim.loop
  local timer = uv.new_timer()
  local augroup = vim.api.nvim_create_augroup("ScrollViewCursorUpdate", { clear = true })
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    group = augroup,
    callback = function()
      timer:stop()
      timer:start(50, 0, vim.schedule_wrap(function()
        if not vim.g.scrollview_refreshing then
          vim.cmd("silent! ScrollViewRefresh")
        end
      end))
    end,
  })

  -- Clean up the timer on exit to prevent leaks
  vim.api.nvim_create_autocmd("VimLeavePre", {
    group = augroup,
    callback = function()
      if timer and not timer:is_closing() then
        timer:close()
      end
    end,
  })
end

return M
