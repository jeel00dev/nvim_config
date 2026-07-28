-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  utils/logger.lua — Structured logging via vim.notify               ║
-- ║                                                                      ║
-- ║  Purpose: Consistent, prefixed log messages throughout the config.   ║
-- ║  Uses nvim-notify when available, falls back to vim.notify.          ║
-- ║                                                                      ║
-- ║  Dependencies: None (nvim-notify optional)                          ║
-- ║  Exports: info(), warn(), error(), debug()                          ║
-- ╚══════════════════════════════════════════════════════════════════════╝

local M = {}

local PREFIX = "nvim"

---@param msg string
---@param level integer vim.log.levels.*
---@param title? string
local function notify(msg, level, title)
  vim.notify(msg, level, { title = title or PREFIX })
end

function M.info(msg, title)
  notify(msg, vim.log.levels.INFO, title)
end

function M.warn(msg, title)
  notify(msg, vim.log.levels.WARN, title)
end

function M.error(msg, title)
  notify(msg, vim.log.levels.ERROR, title)
end

function M.debug(msg, title)
  if vim.env.NVIM_DEBUG then
    notify(msg, vim.log.levels.DEBUG, title)
  end
end

return M
