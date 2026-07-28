-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  utils/paths.lua — Path helper utilities                            ║
-- ║                                                                      ║
-- ║  Purpose: Centralized path resolution for config, data, cache dirs. ║
-- ║                                                                      ║
-- ║  Dependencies: None                                                  ║
-- ║  Exports: config(), data(), cache(), state(), is_file(), is_dir()   ║
-- ╚══════════════════════════════════════════════════════════════════════╝

local M = {}

--- Neovim config directory (~/.config/nvim)
function M.config()
  return vim.fn.stdpath("config")
end

--- Neovim data directory (~/.local/share/nvim)
function M.data()
  return vim.fn.stdpath("data")
end

--- Neovim cache directory (~/.cache/nvim)
function M.cache()
  return vim.fn.stdpath("cache")
end

--- Neovim state directory (~/.local/state/nvim)
function M.state()
  return vim.fn.stdpath("state")
end

--- Check if a path is a file.
---@param path string
---@return boolean
function M.is_file(path)
  local stat = (vim.uv or vim.loop).fs_stat(path)
  return stat ~= nil and stat.type == "file"
end

--- Check if a path is a directory.
---@param path string
---@return boolean
function M.is_dir(path)
  local stat = (vim.uv or vim.loop).fs_stat(path)
  return stat ~= nil and stat.type == "directory"
end

--- Join path segments.
---@param ... string
---@return string
function M.join(...)
  return table.concat({ ... }, "/")
end

return M
