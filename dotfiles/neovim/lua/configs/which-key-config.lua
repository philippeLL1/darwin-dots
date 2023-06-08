local wk = require"which-key"
wk.setup{}
wk.register({
  t = {
	  name = "Telescope Pickers",
	  f = { "<cmd>Telescope find_files<cr>", "Find File" },
	  h = { "<cmd>Telescope colorscheme<cr>", "Choose theme" },
	  m = { "<cmd>Telescope man_pages<cr>", "Open man page" },
	  p = { "<cmd>Telescope planets<cr>", "Planets!" },
	  b = { "<cmd>Telescope buffers<cr>", "Select buffer" },
	  g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
	  s = { "<cmd>Telescope symbols<cr>", "Insert symbol" },
  },
}, { prefix = "<leader>" })
