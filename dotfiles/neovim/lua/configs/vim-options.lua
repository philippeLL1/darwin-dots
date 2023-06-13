-- place all vim api calls here
local set = vim.o
local cmd = vim.cmd
local api = vim.api
local global = vim.g

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
set.expandtab = true
set.smartindent = true
set.tabstop = 2
set.shiftwidth = 2

