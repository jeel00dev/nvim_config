-- features/lsp/servers.lua — LSP server list and per-server settings
--
-- Purpose: Defines which servers to install and their individual configs.

local M = {}

--- Server settings keyed by lspconfig name.
--- Empty table = use defaults. Custom table = merged into server config.
M.servers = {
  lua_ls = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        completion = { callSnippet = "Replace" },
        telemetry = { enable = false },
        diagnostics = { globals = { "vim" } },
      },
    },
  },
  pyright = {},
  ts_ls = {},
  clangd = {
    cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
  },
  -- NOTE: Uncomment these if you install Go / Rust toolchains:
  -- rust_analyzer = {
  --   settings = {
  --     ["rust-analyzer"] = {
  --       checkOnSave = { command = "clippy" },
  --     },
  --   },
  -- },
  -- gopls = {
  --   settings = {
  --     gopls = {
  --       analyses = { unusedparams = true },
  --       staticcheck = true,
  --       gofumpt = true,
  --     },
  --   },
  -- },
  html = {},
  cssls = {},
  jsonls = {
    settings = {
      json = { validate = { enable = true } },
    },
  },
  yamlls = {
    settings = {
      yaml = { keyOrdering = false },
    },
  },
  bashls = {},
}

--- Get list of server names for mason-lspconfig.
function M.names()
  local names = {}
  for name, _ in pairs(M.servers) do
    table.insert(names, name)
  end
  return names
end

return M
