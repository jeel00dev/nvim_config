-- features/treesitter/init.lua — Treesitter configuration
--
-- Purpose: Syntax highlighting, textobjects, autotag, context comments.
-- Dependencies: nvim-treesitter, textobjects, autotag, context-commentstring, matchup
-- Exports: setup()
--
-- Note: Modern nvim-treesitter removed `nvim-treesitter.configs`.
-- Use `require("nvim-treesitter").setup()` and vim.treesitter builtins.

local M = {}

function M.setup()
  -- Parser installation — the main thing nvim-treesitter handles
  require("nvim-treesitter").setup()

  -- Ensure parsers are installed
  local ensure_installed = {
    "bash", "c", "cpp", "css", "diff", "dockerfile",
    "go", "gomod", "html", "javascript", "json",
    "lua", "luadoc", "luap", "make", "markdown", "markdown_inline",
    "python", "query", "regex", "rst", "rust", "scss",
    "toml", "tsx", "typescript", "vim", "vimdoc", "xml",
    "yaml", "zig",
  }

  local installed = require("nvim-treesitter").get_installed()
  local installed_set = {}
  for _, p in ipairs(installed) do
    installed_set[p] = true
  end

  local to_install = {}
  for _, p in ipairs(ensure_installed) do
    if not installed_set[p] then
      table.insert(to_install, p)
    end
  end

  if #to_install > 0 then
    vim.cmd("TSInstall " .. table.concat(to_install, " "))
  end

  -- Matchup
  vim.g.matchup_matchparen_offscreen = { method = "popup" }

  -- Configure treesitter modules and textobjects
  require("nvim-treesitter-textobjects").setup({
    select = {
      enable = true,
      lookahead = true,
    },
    move = {
      enable = true,
      set_jumps = true,
    },
    swap = {
      enable = true,
    },
  })
end

return M
