require"which-key".register({
  ["<leader>f"] = { name = "+file" },
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
  ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  ["<leader>fn"] = { "<cmd>enew<cr>", "New File" },
  ["<ESC>"] = { "<C-\\><C-n>", "Escape from terminal input mode" },
  ["<C-h>"] = { "<C-w>h", "Focus window leftwards" },
  ["<C-j>"] = { "<C-w>j", "Focus window downwards" },
  ["<C-k>"] = { "<C-w>k", "Focus window upwards" },
  ["<C-l>"] = { "<C-w>l", "Focus window rightwards" },
})
