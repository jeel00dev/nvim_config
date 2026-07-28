-- features/project/init.lua — Project detection
-- Dependencies: project.nvim
-- Exports: setup()

local M = {}

function M.setup()
  require("project_nvim").setup({
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git", "Makefile", "package.json", "Cargo.toml", "go.mod", "pyproject.toml" },
    show_hidden = false,
    silent_chdir = true,
    scope_chdir = "global",
  })
end

return M
