-- core/keymaps.lua — Keymap loader
--
-- Purpose: Requires all keymap modules from keymaps/ directory.
-- Plugin-specific keymaps are loaded lazily by their feature modules.

-- Core keymaps are always loaded
require("keymaps.core")

-- Plugin keymaps are loaded by their respective feature modules
-- when the plugin is activated (lazy-loaded). They are NOT loaded here.
-- See: keymaps/lsp.lua, keymaps/git.lua, keymaps/dap.lua, etc.
