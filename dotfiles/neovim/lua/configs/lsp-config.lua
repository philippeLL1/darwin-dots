--[[

# This file contains configuration options for all things LSP!

## Language Servers
  - These are configured using the `lspconfig.'server_name'.setup{}` syntax.
  - Make sure to install the corresponding package when adding a new language
  - `:help lspconfig-all` for a complete reference

--]]


-- LSP configuration for editing neovim lua files
require "neodev".setup {}

-- Setup language servers.
local lspconfig = require('lspconfig')

lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {}

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- make the lua lsp recognize the "vim" global
        globals = { 'vim' },
      },
      telemetry = {
        enable = false,
      },
    }
  }
}

lspconfig.nil_ls.setup {}
lspconfig.clangd.setup {}
lspconfig.metals.setup {}
lspconfig.hls.setup {}

