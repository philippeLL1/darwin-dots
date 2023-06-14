local wk = require"which-key"
wk.setup{}
wk.register({
  p = {
	  name = "Telescope Pickers",
	  f = { "<cmd>Telescope find_files<cr>", "Find File" },
	  h = { "<cmd>Telescope colorscheme<cr>", "Choose theme" },
	  m = { "<cmd>Telescope man_pages<cr>", "Open man page" },
	  p = { "<cmd>Telescope planets<cr>", "Planets!" },
	  b = { "<cmd>Telescope buffers<cr>", "Select buffer" },
	  g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
	  s = { "<cmd>Telescope symbols<cr>", "Insert symbol" },
  },
  f = {
    name = "Find",
    f = { "<cmd>Telescope fd<cr>", "files" },
  },
  t = {
    name = "Tabs",
    n = { "<cmd>tabnew<cr>", "files" },
    c = { "<cmd>tabclose<cr>", "files" },
    o = { "<cmd>tabonly<cr>", "files" },
  }
}, { prefix = "<leader>" })
