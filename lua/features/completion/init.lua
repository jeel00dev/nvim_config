-- features/completion/init.lua — Blink.cmp completion
--
-- Dependencies: blink.cmp, friendly-snippets
-- Exports: setup()

local M = {}

function M.setup()
  require("blink.cmp").setup({
    keymap = { preset = "super-tab" },
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = require("constants").border },
      },
      ghost_text = { enabled = true },
      menu = {
        border = require("constants").border,
        draw = {
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "kind" },
          },
        },
      },
    },
    signature = {
      enabled = true,
      window = { border = require("constants").border },
    },
  })
end

return M
