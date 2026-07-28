-- core/autocmds.lua — Autocommands
--
-- Purpose: All non-plugin autocommands in one place.
-- Uses named groups to avoid duplicates on config reload.

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local constants = require("constants")

-- Highlight yanked text briefly
autocmd("TextYankPost", {
  group = augroup("user_highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Resize splits when terminal is resized
autocmd("VimResized", {
  group = augroup("user_resize_splits", { clear = true }),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Close certain filetypes with 'q'
autocmd("FileType", {
  group = augroup("user_close_with_q", { clear = true }),
  pattern = constants.filetypes.ui,
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  group = augroup("user_trim_whitespace", { clear = true }),
  callback = function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    pcall(vim.api.nvim_win_set_cursor, 0, cursor)
  end,
})

-- Auto-create parent directories when saving a file
autocmd("BufWritePre", {
  group = augroup("user_auto_mkdir", { clear = true }),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return -- skip URLs
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Restore cursor position when reopening a file
autocmd("BufReadPost", {
  group = augroup("user_restore_cursor", { clear = true }),
  callback = function(event)
    local exclude = { "gitcommit", "gitrebase" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].user_cursor_restored then
      return
    end
    vim.b[buf].user_cursor_restored = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local line_count = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Check if file changed outside of Neovim
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("user_checktime", { clear = true }),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})
