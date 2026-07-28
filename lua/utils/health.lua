-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  utils/health.lua — Custom health check (:checkhealth user)         ║
-- ║                                                                      ║
-- ║  Purpose: Verify that all external tools, LSP servers, formatters,   ║
-- ║  linters, and the AI backend are available and working.              ║
-- ║                                                                      ║
-- ║  Dependencies: utils.functions                                      ║
-- ║  Usage: :checkhealth user                                           ║
-- ╚══════════════════════════════════════════════════════════════════════╝

local M = {}

local health = vim.health

--- Check if an executable is on PATH and report.
---@param name string
---@param required boolean
---@param purpose string
local function check_executable(name, required, purpose)
  if vim.fn.executable(name) == 1 then
    health.ok(name .. " found — " .. purpose)
  elseif required then
    health.error(name .. " not found — " .. purpose, { "Install " .. name })
  else
    health.warn(name .. " not found — " .. purpose, { "Install " .. name .. " (optional)" })
  end
end

function M.check()
  -- Core tools
  health.start("Core Tools")
  check_executable("git", true, "Version control")
  check_executable("node", true, "Node.js runtime (LSP servers, formatters)")
  check_executable("npm", true, "Node package manager")
  check_executable("python3", false, "Python runtime")
  check_executable("cargo", false, "Rust toolchain")
  check_executable("go", false, "Go toolchain")

  -- Search tools
  health.start("Search Tools")
  check_executable("rg", true, "ripgrep — fast file search")
  check_executable("fd", true, "fd — fast file finder")
  check_executable("fzf", true, "fzf — fuzzy finder")

  -- CLI enhancements
  health.start("CLI Enhancements")
  check_executable("lazygit", false, "Terminal Git UI")
  check_executable("delta", false, "Git diff pager")
  check_executable("bat", false, "Syntax-highlighted cat")
  check_executable("eza", false, "Modern ls replacement")
  check_executable("zoxide", false, "Smart directory jumper")

  -- Formatters
  health.start("Formatters")
  check_executable("stylua", false, "Lua formatter")
  check_executable("prettier", false, "Web formatter (JS/TS/HTML/CSS/JSON)")
  check_executable("black", false, "Python formatter")
  check_executable("clang-format", false, "C/C++ formatter")
  check_executable("gofumpt", false, "Go formatter")
  check_executable("shfmt", false, "Shell formatter")
  check_executable("rustfmt", false, "Rust formatter")

  -- Linters
  health.start("Linters")
  check_executable("eslint", false, "JavaScript/TypeScript linter")
  check_executable("shellcheck", false, "Shell script linter")

  -- AI backend
  health.start("AI Backend")
  local config = require("config")
  local endpoint = config.get("ai.endpoint", "http://localhost:8080/v1")
  if config.get("ai.enabled", true) then
    health.info("AI provider: " .. config.get("ai.provider", "minuet"))
    health.info("AI backend: " .. config.get("ai.backend", "llama_cpp"))
    health.info("AI endpoint: " .. endpoint)
    health.info("Verify llama.cpp server is running at: " .. endpoint)
  else
    health.info("AI integration is disabled")
  end

  -- Neovim version
  health.start("Neovim")
  local v = vim.version()
  local version_str = string.format("%d.%d.%d", v.major, v.minor, v.patch)
  if v.minor >= 10 then
    health.ok("Neovim " .. version_str .. " (>= 0.10 required)")
  else
    health.error("Neovim " .. version_str .. " — version 0.10+ required")
  end
end

return M
