-- features/ui/noice.lua — Noice.nvim configuration
--
-- Purpose: Modern command line, messages, and popups UI.
-- Replaces default cmdline, messages, and popupmenu.
--
-- Dependencies: noice.nvim, nui.nvim, nvim-notify
-- Exports: setup()

local M = {}

function M.setup()
  local constants = require("constants")

  require("noice").setup({
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      format = {
        cmdline = { pattern = "^:", icon = " ", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = " ", lang = "bash" },
        lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = " ", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖 " },
      },
    },
    messages = {
      enabled = true,
      view = "notify",
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
      view_search = "virtualtext",
    },
    popupmenu = {
      enabled = true,
      backend = "nui",
    },
    lsp = {
      progress = { enabled = true },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = { enabled = true },
      signature = { enabled = true },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
    views = {
      cmdline_popup = {
        border = { style = constants.border },
        position = { row = "40%", col = "50%" },
        size = { width = 60, height = "auto" },
      },
      popupmenu = {
        border = { style = constants.border },
        relative = "editor",
        position = { row = "45%", col = "50%" },
        size = { width = 60, height = 10 },
      },
    },
    routes = {
      -- Suppress "written" messages
      { filter = { event = "msg_show", kind = "", find = "written" }, opts = { skip = true } },
      -- Suppress search count messages (shown in statusline)
      { filter = { event = "msg_show", kind = "search_count" }, opts = { skip = true } },
    },
  })
end

return M
