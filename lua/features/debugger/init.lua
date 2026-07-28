-- features/debugger/init.lua — DAP debugging setup
--
-- Purpose: Debug adapter protocol with UI, virtual text, and mason integration.
-- Dependencies: nvim-dap, nvim-dap-ui, nvim-dap-virtual-text, mason-nvim-dap
-- Exports: setup()

local M = {}

function M.setup()
  local dap = require("dap")
  local dapui = require("dapui")
  local icons = require("theme.icons")
  local constants = require("constants")

  -- DAP UI
  dapui.setup({
    icons = {
      expanded = icons.ui.arrow_down,
      collapsed = icons.ui.arrow_right,
      current_frame = icons.dap.stopped,
    },
    floating = { border = constants.border },
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.35 },
          { id = "breakpoints", size = 0.15 },
          { id = "stacks", size = 0.25 },
          { id = "watches", size = 0.25 },
        },
        size = 40,
        position = "right",
      },
      {
        elements = {
          { id = "repl", size = 0.5 },
          { id = "console", size = 0.5 },
        },
        size = 0.25,
        position = "bottom",
      },
    },
  })

  -- Virtual text
  require("nvim-dap-virtual-text").setup({
    commented = true,
  })

  -- Mason DAP
  require("mason-nvim-dap").setup({
    automatic_installation = true,
    ensure_installed = { "python", "codelldb" },
  })

  -- Breakpoint signs
  vim.fn.sign_define("DapBreakpoint", {
    text = icons.dap.breakpoint, texthl = "DapBreakpoint", linehl = "", numhl = "",
  })
  vim.fn.sign_define("DapBreakpointCondition", {
    text = icons.dap.breakpoint_condition, texthl = "DapBreakpointCondition", linehl = "", numhl = "",
  })
  vim.fn.sign_define("DapBreakpointRejected", {
    text = icons.dap.breakpoint_rejected, texthl = "DapBreakpointRejected", linehl = "", numhl = "",
  })
  vim.fn.sign_define("DapLogPoint", {
    text = icons.dap.log_point, texthl = "DapLogPoint", linehl = "", numhl = "",
  })
  vim.fn.sign_define("DapStopped", {
    text = icons.dap.stopped, texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "",
  })

  -- Auto open/close DAP UI
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

return M
