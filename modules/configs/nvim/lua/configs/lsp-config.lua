local lsp = require 'lspconfig' -- builtin lsp
local coq = require 'coq' -- completion plugin

-- servers
lsp.pyright.setup{coq.lsp_ensure_capabilities()}
lsp.nil_ls.setup{coq.lsp_ensure_capabilities()}
lsp.lua_ls.setup{coq.lsp_ensure_capabilities()}
