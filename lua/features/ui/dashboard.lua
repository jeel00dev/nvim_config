-- features/ui/dashboard.lua — Alpha-nvim dashboard with galaxy ASCII art
--
-- Purpose: Startup screen with galaxy-themed ASCII art, quick-action
-- buttons, and plugin load stats in the footer.
--
-- Dependencies: alpha-nvim
-- Exports: setup()

local M = {}

-- Galaxy ASCII art
M.header = {
  [[                                                       ]],
  [[              ·  .  ✦    ˚   ✵    ·    .  ✦            ]],
  [[          ·  ✦  .    *  ·     ★  .    ·  ✦  .          ]],
  [[       .    ·    .    ·    ✦    ·    .    ·    .        ]],
  [[     ✵    ·  ███╗   ██╗██╗   ██╗██╗███╗   ███╗  ·     ]],
  [[      .  ★   ████╗  ██║██║   ██║██║████╗ ████║   ✦    ]],
  [[    ·    .   ██╔██╗ ██║██║   ██║██║██╔████╔██║  ·     ]],
  [[     ✦   .  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║    .   ]],
  [[      ·  ✦  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║  ★     ]],
  [[    .    ·  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝    ✵   ]],
  [[     ✦   .    ★  ·    ✵   .    ·    ✦  .    ·         ]],
  [[          .  ·    ✦  .  ·    ˚   ✵    .  ·            ]],
  [[              ·    .    ✦    ·    .    ·                ]],
  [[                                                       ]],
}

function M.setup()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")
  local icons = require("theme.icons")

  -- Header
  dashboard.section.header.val = M.header
  dashboard.section.header.opts.hl = "AlphaHeader"

  -- Buttons
  dashboard.section.buttons.val = {
    dashboard.button("f", icons.ui.search .. "  Find file", "<cmd>FzfLua files<CR>"),
    dashboard.button("r", icons.ui.fire .. "  Recent files", "<cmd>FzfLua oldfiles<CR>"),
    dashboard.button("g", icons.ui.telescope .. "  Live grep", "<cmd>FzfLua live_grep<CR>"),
    dashboard.button("p", icons.ui.package .. "  Projects", "<cmd>FzfLua projects<CR>"),
    dashboard.button("s", icons.ui.lightning .. "  Restore session", "<cmd>SessionLoad<CR>"),
    dashboard.button("c", icons.ui.gear .. "  Configuration", "<cmd>edit " .. vim.fn.stdpath("config") .. "/lua/config/user.lua<CR>"),
    dashboard.button("l", icons.ui.lazy .. " Plugins", "<cmd>Lazy<CR>"),
    dashboard.button("h", icons.ui.star .. "  Health check", "<cmd>Health<CR>"),
    dashboard.button("q", icons.ui.close .. "  Quit", "<cmd>qa<CR>"),
  }

  for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = "AlphaButtons"
    button.opts.hl_shortcut = "AlphaShortcut"
    button.opts.cursor = 0
    button.opts.width = 40
  end

  -- Footer: plugin stats
  dashboard.section.footer.val = ""
  dashboard.section.footer.opts.hl = "AlphaFooter"

  -- Show plugin stats after lazy.nvim finishes loading
  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    once = true,
    callback = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = "⚡ " .. stats.loaded .. "/" .. stats.count .. " plugins loaded in " .. ms .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })

  -- Layout with spacing
  dashboard.config.layout = {
    { type = "padding", val = 2 },
    dashboard.section.header,
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    { type = "padding", val = 1 },
    dashboard.section.footer,
  }

  alpha.setup(dashboard.config)
end

return M
