-- features/diagnostics/init.lua — Trouble, inline diagnostics, glance, signature
-- Exports: setup()

local M = {}

function M.setup()
  local constants = require("constants")
  local icons = require("theme.icons")

  -- Trouble
  require("trouble").setup({
    position = "bottom",
    height = 10,
    icons = true,
    auto_open = false,
    auto_close = true,
    use_diagnostic_signs = true,
  })

  -- Tiny inline diagnostics
  require("tiny-inline-diagnostic").setup({
    preset = "modern",
    options = {
      show_source = true,
      throttle = 200,
      multilines = true,
    },
  })

  -- Glance (peek definitions/references)
  require("glance").setup({
    border = { enable = true },
    height = 18,
    zindex = 45,
  })

  -- LSP signature help
  require("lsp_signature").setup({
    bind = true,
    handler_opts = { border = constants.border },
    hint_enable = true,
    hint_prefix = icons.ui.lightning .. " ",
    floating_window = true,
    floating_window_above_cur_line = true,
    fix_pos = false,
    toggle_key = "<C-k>",
  })
end

return M
