-- adapters/picker.lua — Fuzzy finder abstraction
--
-- Purpose: Wraps fzf-lua so higher-level code never calls the plugin
-- directly. If fzf-lua is replaced later, only this file changes.
--
-- Exports: find_files(), live_grep(), buffers(), oldfiles(), help(),
--          lsp_references(), lsp_definitions(), diagnostics()

local M = {}

local function call(method, opts)
  require("fzf-lua")[method](opts or {})
end

function M.find_files(opts) call("files", opts) end
function M.live_grep(opts) call("live_grep", opts) end
function M.buffers(opts) call("buffers", opts) end
function M.oldfiles(opts) call("oldfiles", opts) end
function M.help(opts) call("helptags", opts) end
function M.lsp_references(opts) call("lsp_references", opts) end
function M.lsp_definitions(opts) call("lsp_definitions", opts) end
function M.lsp_implementations(opts) call("lsp_implementations", opts) end
function M.diagnostics(opts) call("diagnostics_workspace", opts) end
function M.commands(opts) call("commands", opts) end
function M.keymaps(opts) call("keymaps", opts) end
function M.resume(opts) call("resume", opts) end

return M
