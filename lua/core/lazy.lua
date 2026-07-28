-- core/lazy.lua — lazy.nvim bootstrap and setup
--
-- Purpose: Installs lazy.nvim if missing, then configures it to
-- import all plugin specs from lua/plugins/.

local M = {}

function M.setup()
  -- Bootstrap lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local out = vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
      }, true, {})
      return
    end
  end
  vim.opt.rtp:prepend(lazypath)

  -- Setup lazy.nvim
  require("lazy").setup({
    spec = {
      { import = "plugins" }, -- Auto-import all files in lua/plugins/
    },
    defaults = {
      lazy = true, -- All plugins lazy by default
    },
    install = {
      colorscheme = { "catppuccin", "default" },
    },
    ui = {
      border = require("constants").border,
      title = " Plugins ",
      icons = {
        cmd = " ",
        config = " ",
        event = " ",
        ft = " ",
        init = " ",
        import = " ",
        keys = " ",
        lazy = "💤 ",
        loaded = "●",
        not_loaded = "○",
        plugin = " ",
        runtime = " ",
        require = "󰢱 ",
        source = " ",
        start = " ",
        task = "✔ ",
        list = { "●", "➜", "★", "‒" },
      },
    },
    checker = {
      enabled = false, -- Don't auto-check for updates
    },
    change_detection = {
      notify = false, -- Don't notify on config file changes
    },
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "matchit",
          "matchparen",
          "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
  })
end

return M
