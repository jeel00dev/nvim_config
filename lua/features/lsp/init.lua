-- features/lsp/init.lua — LSP orchestrator
--
-- Purpose: Sets up Mason, mason-lspconfig, and configures all servers
--          using the new vim.lsp.config API (Neovim 0.11+).
-- Exports: setup(), reload(), health()

local M = {}

function M.setup()
  local servers = require("features.lsp.servers")
  local capabilities = require("features.lsp.capabilities").get()
  local handlers = require("features.lsp.handlers")
  local diagnostics = require("features.lsp.diagnostics")

  -- Configure handlers and diagnostics first
  handlers.setup()
  diagnostics.setup()

  -- Setup Mason
  require("mason").setup({
    ui = {
      border = require("constants").border,
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  -- Setup mason-lspconfig to auto-install servers
  require("mason-lspconfig").setup({
    ensure_installed = servers.names(),
    automatic_installation = true,
  })

  -- Configure each server via vim.lsp.config (Neovim 0.11+)
  for name, server_opts in pairs(servers.servers) do
    local opts = vim.tbl_deep_extend("force", {
      capabilities = capabilities,
    }, server_opts)
    vim.lsp.config(name, opts)
  end

  -- Enable all configured servers
  vim.lsp.enable(servers.names())

  -- Set up LSP keymaps via LspAttach autocmd
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      require("keymaps.lsp").on_attach(client, ev.buf)
    end,
  })
end

function M.reload()
  vim.cmd("LspStop")
  vim.defer_fn(function()
    vim.cmd("LspStart")
  end, 500)
end

function M.health()
  local health = vim.health
  local servers = require("features.lsp.servers")
  for _, name in ipairs(servers.names()) do
    local cfg = vim.lsp.config[name]
    if cfg then
      health.ok("LSP server config available: " .. name)
    else
      health.warn("LSP server config not found: " .. name)
    end
  end
end

return M
