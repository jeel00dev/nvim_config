-- core/commands.lua — Custom development commands
--
-- Purpose: User commands for config maintenance and development.
-- Commands: :ReloadConfig, :ReloadTheme, :RestartLSP, :RestartAI,
--           :Profile, :EditConfig, :Health, :SyncPlugins

local cmd = vim.api.nvim_create_user_command

cmd("ReloadConfig", function()
  -- Reload config module
  require("config").reload()
  -- Re-apply theme
  require("theme").reload()
  vim.notify("Configuration reloaded", vim.log.levels.INFO, { title = "Config" })
end, { desc = "Reload Neovim configuration" })

cmd("ReloadTheme", function()
  require("theme").reload()
  vim.notify("Theme reloaded", vim.log.levels.INFO, { title = "Theme" })
end, { desc = "Reload theme and highlights" })

cmd("RestartLSP", function()
  vim.cmd("LspStop")
  vim.defer_fn(function()
    vim.cmd("LspStart")
    vim.notify("LSP restarted", vim.log.levels.INFO, { title = "LSP" })
  end, 500)
end, { desc = "Restart all LSP clients" })

cmd("RestartAI", function()
  -- Placeholder: will be implemented when AI feature is built
  vim.notify("AI provider restarted", vim.log.levels.INFO, { title = "AI" })
end, { desc = "Restart AI provider" })

cmd("Profile", function()
  vim.cmd("Lazy profile")
end, { desc = "Open lazy.nvim profiler" })

cmd("EditConfig", function()
  vim.cmd("edit " .. vim.fn.stdpath("config"))
end, { desc = "Open config directory" })

cmd("Health", function()
  vim.cmd("checkhealth user")
end, { desc = "Run custom health check" })

cmd("SyncPlugins", function()
  vim.cmd("Lazy sync")
end, { desc = "Synchronize plugins" })

cmd("Format", function()
  require("conform").format({ lsp_fallback = true })
end, { desc = "Format buffer manually" })

cmd("FormatToggle", function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  vim.notify("Autoformat-on-save " .. (vim.g.disable_autoformat and "disabled" or "enabled"), vim.log.levels.INFO, { title = "Format" })
end, { desc = "Toggle autoformat-on-save" })
