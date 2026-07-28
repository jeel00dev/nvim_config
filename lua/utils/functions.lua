-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  utils/functions.lua — Reusable helper functions                    ║
-- ║                                                                      ║
-- ║  Purpose: Common utilities used throughout the config.               ║
-- ║  Avoids duplicating helper logic across modules.                     ║
-- ║                                                                      ║
-- ║  Dependencies: None                                                  ║
-- ║  Exports: map(), augroup(), feedkeys(), has_plugin(), lazy_require() ║
-- ╚══════════════════════════════════════════════════════════════════════╝

local M = {}

--- Create a keymap with sensible defaults.
---@param mode string|table Mode(s) — "n", "i", "v", {"n", "v"}, etc.
---@param lhs string Left-hand side of the mapping
---@param rhs string|function Right-hand side or callback
---@param desc string Description (shown in which-key)
---@param opts? table Additional options (buffer, silent, etc.)
function M.map(mode, lhs, rhs, desc, opts)
  opts = vim.tbl_extend("force", { desc = desc, silent = true, noremap = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

--- Create a named autocommand group (clears previous).
---@param name string Group name
---@return integer augroup_id
function M.augroup(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

--- Create an autocommand with a named group.
---@param group_name string Group name (prefixed with "user_")
---@param event string|table Event(s)
---@param opts table Autocommand options (pattern, callback, etc.)
function M.autocmd(group_name, event, opts)
  opts.group = M.augroup(group_name)
  vim.api.nvim_create_autocmd(event, opts)
end

--- Check if a plugin is available (installed via lazy.nvim).
---@param name string Plugin name
---@return boolean
function M.has_plugin(name)
  local ok, lazy_config = pcall(require, "lazy.core.config")
  if not ok then
    return false
  end
  return lazy_config.plugins[name] ~= nil
end

--- Lazy-require a module (defers require until first access).
---@param module string Module name
---@return table Proxy table that requires on first use
function M.lazy_require(module)
  return setmetatable({}, {
    __index = function(_, key)
      return require(module)[key]
    end,
    __call = function(_, ...)
      return require(module)(...)
    end,
  })
end

--- Check if an executable exists on PATH.
---@param name string Executable name
---@return boolean
function M.executable(name)
  return vim.fn.executable(name) == 1
end

--- Get the Neovim config directory path.
---@return string
function M.config_dir()
  return vim.fn.stdpath("config")
end

return M
