-- Setup language servers.
local lspconfig = require('lspconfig')

lspconfig.pyright.setup{}
lspconfig.tsserver.setup{}
lspconfig.rust_analyzer.setup{}

lspconfig.lua_ls.setup{
  settings = {
    Lua = {
      diagnostics = {
        -- make the lua lsp recognize the "vim" global
        globals = {'vim'},
      },
      telemetry = {
        enable = false,
      },
    }
  }
}

lspconfig.nil_ls.setup{}
lspconfig.clangd.setup{}
