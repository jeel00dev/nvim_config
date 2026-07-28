-- theme/highlights/init.lua — Loads all highlight sub-modules
--
-- Purpose: Single entry point that applies all custom highlights.
-- Called after the colorscheme is loaded to override defaults.

local M = {}

local modules = {
  "theme.highlights.editor",
  "theme.highlights.syntax",
  "theme.highlights.lsp",
  "theme.highlights.git",
  "theme.highlights.cmp",
  "theme.highlights.dap",
  "theme.highlights.ui",
  "theme.highlights.markdown",
}

--- Apply all highlight groups.
function M.setup()
  for _, mod in ipairs(modules) do
    local ok, apply = pcall(require, mod)
    if ok and type(apply) == "function" then
      apply()
    end
  end
end

--- Reload highlights (clears module cache first).
function M.reload()
  for _, mod in ipairs(modules) do
    package.loaded[mod] = nil
  end
  M.setup()
end

return M
