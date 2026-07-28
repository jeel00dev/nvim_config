-- keymaps/lsp.lua — LSP keybindings
--
-- Purpose: Keymaps set when an LSP server attaches to a buffer.
-- These are buffer-local so they only work in LSP-enabled buffers.

local M = {}

--- Called from LSP on_attach. Sets buffer-local keymaps.
---@param client table LSP client
---@param bufnr integer Buffer number
function M.on_attach(client, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true, noremap = true })
  end

  -- Navigation
  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
  map("n", "gr", function() require("fzf-lua").lsp_references() end, "References")
  map("n", "gt", vim.lsp.buf.type_definition, "Type definition")

  -- Info
  map("n", "K", vim.lsp.buf.hover, "Hover documentation")
  map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
  map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")

  -- Actions
  map("n", "<leader>la", vim.lsp.buf.code_action, "Code actions")
  map("v", "<leader>la", vim.lsp.buf.code_action, "Code actions")
  map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
  map("n", "<leader>lf", function() require("features.lsp.formatting").format() end, "Format")

  -- Diagnostics
  map("n", "<leader>ld", vim.diagnostic.open_float, "Line diagnostics")
  map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
  map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")

  -- Info
  map("n", "<leader>li", "<cmd>LspInfo<CR>", "LSP info")
  map("n", "<leader>lI", "<cmd>Mason<CR>", "Mason")
  map("n", "<leader>ls", function() require("fzf-lua").lsp_document_symbols() end, "Document symbols")
  map("n", "<leader>lS", function() require("fzf-lua").lsp_workspace_symbols() end, "Workspace symbols")
end

return M
