-- place all vim api calls here
local set = vim.o
local cmd = vim.cmd
local api = vim.api
local global = vim.g
local lsp = vim.lsp

vim.wo.relativenumber = true

-- set <leader> to spacebar
global.mapleader = ' '

-- default colorscheme
cmd "colorscheme melange"

-- remove tilde fringe
cmd "set fillchars=eob:\\ "

-- set notification api to notify-nvim plugin
vim.notify = require("notify")
vim.go.termguicolors = true

-- better terminal mode cursor
api.nvim_set_hl(0, "TerminalCursorShape", { underline = true })
api.nvim_create_autocmd("TermEnter", {
  callback = function()
   cmd "setlocal winhighlight=TermCursor:TerminalCursorShape"
  end,
})

lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Disable signs
    signs = false,
  }
)

-- 2 space tabs
set.expandtab = true
set.smartindent = true
set.tabstop = 2
set.shiftwidth = 2

-- LSP UI Config
vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
