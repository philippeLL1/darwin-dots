vim.wo.relativenumber = true
vim.g.mapleader = ' '
require"configs.treesitter-config"
require"configs.neoscroll-config"
vim.cmd "colorscheme oxocarbon"
vim.o.timeout = true
vim.o.timeoutlen = 3
require"which-key".setup{}
require"glow".setup{}

require"which-key".register({
  ["<leader>f"] = { name = "+file" },
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
  ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  ["<leader>fn"] = { "<cmd>enew<cr>", "New File" },
  ["<ESC>"] = { "<C-\\><C-n>", "Escape from terminal input mode" },
})
require"noice".setup{}
