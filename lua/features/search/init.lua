-- features/search/init.lua — FZF-Lua fuzzy finder
--
-- Purpose: Fast file/text searching with ripgrep + fd backends.
-- Dependencies: fzf-lua
-- Exports: setup()

local M = {}

function M.setup()
  local palette = require("theme.palette")
  local constants = require("constants")

  local fzf_bin = nil
  if vim.fn.executable("fzf") == 0 then
    local local_fzf = vim.fn.stdpath("data") .. "/lazy/fzf/bin/fzf"
    if vim.fn.executable(local_fzf) == 1 then
      fzf_bin = local_fzf
    end
  end

  require("fzf-lua").setup({
    fzf_bin = fzf_bin,
    winopts = {
      height = constants.window.height,
      width = constants.window.width,
      row = 0.35,
      col = 0.50,
      border = constants.border,
      preview = {
        border = constants.border,
        layout = "flex",
        flip_columns = 120,
        delay = 50,
      },
    },
    keymap = {
      builtin = {
        ["<C-d>"] = "preview-page-down",
        ["<C-u>"] = "preview-page-up",
      },
      fzf = {
        ["ctrl-q"] = "select-all+accept",
      },
    },
    fzf_opts = {
      ["--layout"] = "reverse",
      ["--info"] = "inline-right",
    },
    files = {
      prompt = "Files❯ ",
      fd_opts = [[--color=never --type f --hidden --follow --exclude .git]],
    },
    grep = {
      prompt = "Grep❯ ",
      rg_opts = [[--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e]],
    },
    lsp = {
      prompt_postfix = "❯ ",
      code_actions = { previewer = "codeaction_native" },
    },
  })
end

return M
