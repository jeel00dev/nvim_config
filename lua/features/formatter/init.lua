-- features/formatter/init.lua — Conform.nvim formatting
-- Exports: setup()

local M = {}

function M.setup()
  local config = require("config")

  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      go = { "gofumpt" },
      rust = { "rustfmt" },
      sh = { "shfmt" },
      bash = { "shfmt" },
    },
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      if not config.get("formatter.format_on_save", true) then
        return
      end
      return {
        timeout_ms = config.get("formatter.timeout_ms", 3000),
        lsp_fallback = true,
      }
    end,
  })
end

return M
