-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  utils/cache.lua — Simple key-value cache                           ║
-- ║                                                                      ║
-- ║  Purpose: Lightweight in-memory cache with optional TTL.             ║
-- ║  Use for expensive computations, filesystem queries, parsed config.  ║
-- ║                                                                      ║
-- ║  Dependencies: None                                                  ║
-- ║  Exports: get(), set(), has(), clear(), get_or_set()                ║
-- ╚══════════════════════════════════════════════════════════════════════╝

local M = {}

---@class CacheEntry
---@field value any
---@field expires_at? number Epoch time when entry expires (nil = never)

---@type table<string, CacheEntry>
local _store = {}

--- Set a cache value.
---@param key string
---@param value any
---@param ttl_seconds? number Time-to-live in seconds (nil = permanent)
function M.set(key, value, ttl_seconds)
  _store[key] = {
    value = value,
    expires_at = ttl_seconds and (os.time() + ttl_seconds) or nil,
  }
end

--- Get a cached value. Returns nil if expired or missing.
---@param key string
---@return any|nil
function M.get(key)
  local entry = _store[key]
  if not entry then
    return nil
  end
  if entry.expires_at and os.time() > entry.expires_at then
    _store[key] = nil
    return nil
  end
  return entry.value
end

--- Check if key exists and is not expired.
---@param key string
---@return boolean
function M.has(key)
  return M.get(key) ~= nil
end

--- Get cached value, or compute and cache it.
---@param key string
---@param compute function Returns the value to cache
---@param ttl_seconds? number
---@return any
function M.get_or_set(key, compute, ttl_seconds)
  local value = M.get(key)
  if value ~= nil then
    return value
  end
  value = compute()
  M.set(key, value, ttl_seconds)
  return value
end

--- Clear one key or the entire cache.
---@param key? string If nil, clears everything
function M.clear(key)
  if key then
    _store[key] = nil
  else
    _store = {}
  end
end

return M
