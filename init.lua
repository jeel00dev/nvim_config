-- ╔══════════════════════════════════════════════════════════════════════╗
-- ║  init.lua — Neovim Configuration Entry Point                        ║
-- ║                                                                      ║
-- ║  This file does exactly three things:                                ║
-- ║  1. Set leader keys (must happen before any plugins load)            ║
-- ║  2. Register the custom health check module                          ║
-- ║  3. Bootstrap the core module (options → keymaps → lazy)             ║
-- ║                                                                      ║
-- ║  All logic lives in lua/ — this file stays minimal.                  ║
-- ╚══════════════════════════════════════════════════════════════════════╝

-- 1. Leader keys — MUST be set before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 2. Register health check module
vim.g.health = { user = "utils.health" }

-- 3. Bootstrap everything
require("core").setup()
