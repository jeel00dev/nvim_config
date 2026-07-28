-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  theme/ui.lua — Shared UI utilities                                 ║
-- ║                                                                      ║
-- ║  Purpose: Reusable UI helpers for consistent floating windows,       ║
-- ║  borders, popups, and spacing across every plugin.                   ║
-- ║                                                                      ║
-- ║  Dependencies: theme.palette, constants                             ║
-- ║  Exports: border, float_opts(), popup_title(), float_dimensions()   ║
-- ╚══════════════════════════════════════════════════════════════════════╝

local constants = require("constants")
local palette = require("theme.palette")

local M = {}

-- The border style used everywhere. Change once, updates globally.
M.border = constants.border

-- Separator characters for statusline/bufferline
M.separator = { left = "", right = "" }
M.separator_thin = { left = "", right = "" }

--- Generate float window options (centered, with consistent styling).
---@param opts? table Override width_ratio, height_ratio, etc.
---@return table float_opts suitable for vim.api.nvim_open_win()
function M.float_opts(opts)
  opts = opts or {}
  local width_ratio = opts.width or constants.window.width
  local height_ratio = opts.height or constants.window.height
  local columns = vim.o.columns
  local lines = vim.o.lines
  local width = math.floor(columns * width_ratio)
  local height = math.floor(lines * height_ratio)
  width = math.max(width, constants.window.min_width)
  height = math.max(height, constants.window.min_height)
  return {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((columns - width) / 2),
    row = math.floor((lines - height) / 2),
    style = "minimal",
    border = M.border,
  }
end

--- Create styled popup title with consistent formatting.
---@param title string
---@param icon? string Optional icon prefix
---@return string
function M.popup_title(title, icon)
  if icon then
    return " " .. icon .. " " .. title .. " "
  end
  return " " .. title .. " "
end

--- Calculate centered float dimensions from a ratio.
---@param width_ratio number 0.0–1.0
---@param height_ratio number 0.0–1.0
---@return { width: integer, height: integer, col: integer, row: integer }
function M.float_dimensions(width_ratio, height_ratio)
  local columns = vim.o.columns
  local lines = vim.o.lines
  local width = math.floor(columns * width_ratio)
  local height = math.floor(lines * height_ratio)
  return {
    width = width,
    height = height,
    col = math.floor((columns - width) / 2),
    row = math.floor((lines - height) / 2),
  }
end

--- Apply consistent border to an existing window.
---@param win integer Window handle
function M.apply_border(win)
  if vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_win_set_config(win, { border = M.border })
  end
end

--- Standard window highlight overrides for floating windows.
---@return string winhighlight value
function M.float_winhighlight()
  return "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:CursorLine"
end

return M
