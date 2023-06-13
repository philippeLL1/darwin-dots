-- place all vim api calls here
vim.opt.termguicolors = true
vim.wo.relativenumber = true
vim.g.mapleader = ' '
vim.cmd "colorscheme melange"
vim.cmd "set fillchars=eob:\\ "
vim.notify = require("notify")
vim.o.timeout = true
vim.o.timeoutlen = 3
vim.g.termguicolors = true
vim.api.nvim_set_hl(0, "TerminalCursorShape", { underline = true })
vim.api.nvim_create_autocmd("TermEnter", {
  callback = function()
   vim.cmd "setlocal winhighlight=TermCursor:TerminalCursorShape"
  end,
})
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- delay update diagnostics
    update_in_insert = true,
  }
)
