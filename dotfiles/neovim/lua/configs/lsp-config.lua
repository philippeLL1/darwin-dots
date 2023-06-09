-- Setup language servers.
local lspconfig = require('lspconfig')
local coq = require"coq"

lspconfig.pyright.setup(coq.lsp_ensure_capabilities())
lspconfig.tsserver.setup(coq.lsp_ensure_capabilities())
lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities())
lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities())
lspconfig.nil_ls.setup(coq.lsp_ensure_capabilities())
lspconfig.clangd.setup(coq.lsp_ensure_capabilities())
