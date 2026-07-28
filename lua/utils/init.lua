-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  utils/init.lua — Utility re-exports                                ║
-- ║                                                                      ║
-- ║  Purpose: Convenience module that re-exports commonly used utils.    ║
-- ║  Usage: local utils = require("utils")                              ║
-- ║         utils.map("n", ...)                                         ║
-- ╚══════════════════════════════════════════════════════════════════════╝

local M = {}

-- Re-export commonly used functions at the top level
local functions = require("utils.functions")
M.map = functions.map
M.augroup = functions.augroup
M.autocmd = functions.autocmd
M.has_plugin = functions.has_plugin
M.lazy_require = functions.lazy_require
M.executable = functions.executable

-- Sub-modules accessible as utils.logger, utils.paths, etc.
M.logger = require("utils.logger")
M.paths = require("utils.paths")
M.cache = require("utils.cache")

return M
