-- features/lint/init.lua — nvim-lint linting
-- Exports: setup()

local M = {}

function M.setup()
  local lint = require("lint")

  lint.linters_by_ft = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    python = { "ruff" },
    sh = { "shellcheck" },
    bash = { "shellcheck" },
  }

  -- Lint on save and InsertLeave
  vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufReadPost" }, {
    group = vim.api.nvim_create_augroup("user_lint", { clear = true }),
    callback = function()
      -- Only lint if the linter is available
      local ft = vim.bo.filetype
      local linters = lint.linters_by_ft[ft]
      if linters then
        lint.try_lint()
      end
    end,
  })
end

return M
