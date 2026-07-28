-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  config/init.lua — Configuration loader                             ║
-- ║                                                                      ║
-- ║  Purpose: Merges defaults.lua with user.lua and exposes a get()     ║
-- ║  function for dot-path access (e.g., get("ai.endpoint")).            ║
-- ║                                                                      ║
-- ║  Dependencies: config.defaults, config.user                         ║
-- ║  Exports: get(path), raw()                                          ║
-- ╚══════════════════════════════════════════════════════════════════════╝

local M = {}

--- Deep merge table `src` into `dst` (mutates dst).
---@param dst table
---@param src table
---@return table
local function deep_merge(dst, src)
  for k, v in pairs(src) do
    if type(v) == "table" and type(dst[k]) == "table" then
      deep_merge(dst[k], v)
    else
      dst[k] = v
    end
  end
  return dst
end

-- Load and merge configuration once
local _config = nil

local function load_config()
  if _config then
    return _config
  end
  local defaults = require("config.defaults")
  -- user.lua may not exist or may return empty table
  local ok, user = pcall(require, "config.user")
  if not ok then
    user = {}
  end
  _config = deep_merge(vim.deepcopy(defaults), user)
  return _config
end

--- Get a config value by dot-separated path.
--- Example: get("ai.endpoint") → "http://localhost:8080/v1"
---@param path string Dot-separated key path
---@param fallback any Optional fallback if path not found
---@return any
function M.get(path, fallback)
  local cfg = load_config()
  local value = cfg
  for segment in path:gmatch("[^%.]+") do
    if type(value) ~= "table" then
      return fallback
    end
    value = value[segment]
  end
  if value == nil then
    return fallback
  end
  return value
end

--- Get the entire merged config table (read-only use).
---@return table
function M.raw()
  return load_config()
end

--- Force reload configuration (used by :ReloadConfig).
function M.reload()
  package.loaded["config.defaults"] = nil
  package.loaded["config.user"] = nil
  _config = nil
  load_config()
end

return M
