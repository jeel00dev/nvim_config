-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  config/defaults.lua — Single source of truth for all settings      ║
-- ║                                                                      ║
-- ║  Purpose: Every configurable value lives here. Feature modules       ║
-- ║  read from this table via require("config").get(). Users override    ║
-- ║  values in config/user.lua without modifying this file.              ║
-- ║                                                                      ║
-- ║  Dependencies: None                                                  ║
-- ╚══════════════════════════════════════════════════════════════════════╝

return {
  -- Leader keys
  leader = " ",
  localleader = "\\",

  -- UI settings
  ui = {
    border = "rounded",
    transparency = false,
    global_statusline = true,
    cursorline = true,
    relative_numbers = true,
    signcolumn = "yes",
    scrolloff = 8,
    sidescrolloff = 8,
  },

  -- Theme settings
  theme = {
    colorscheme = "custom",
    variant = "mocha",
    background = "dark",
  },

  -- Startup
  startup = {
    dashboard = true,
  },

  -- AI settings
  ai = {
    enabled = true,
    provider = "minuet",
    backend = "llama_cpp",
    endpoint = "http://localhost:8080/v1",
    model = "qwen2.5-coder-14b-instruct-q3_k_m.gguf",
    api_key = "TERM",              -- Must be env var NAME (TERM always exists)
    context_window = 32000,        -- ~8000 tokens of surrounding code for deep context awareness
    max_tokens = 2048,             -- Enough for one-shot complete function implementations
  },

  -- LSP settings
  lsp = {
    format_on_save = true,
    auto_install_servers = true,
    diagnostic_virtual_text = false, -- tiny-inline-diagnostic handles this
    servers = {
      "lua_ls",
      "pyright",
      "ts_ls",
      "clangd",
      -- "rust_analyzer", -- requires Rust toolchain
      -- "gopls",         -- requires Go toolchain
      "html",
      "cssls",
      "jsonls",
      "yamlls",
      "bashls",
    },
  },

  -- Formatter settings
  formatter = {
    format_on_save = true,
    timeout_ms = 3000,
  },

  -- Git settings
  git = {
    signs = true,
    current_line_blame = false,
  },

  -- Performance
  performance = {
    lazy_load = true,
    profile_startup = false,
  },
}
