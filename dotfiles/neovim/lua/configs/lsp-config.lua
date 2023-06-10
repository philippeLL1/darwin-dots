-- Setup language servers.
local lspconfig = require('lspconfig')

lspconfig.pyright.setup{}
lspconfig.tsserver.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.lua_ls.setup{}
lspconfig.nil_ls.setup{}
lspconfig.clangd.setup{}
