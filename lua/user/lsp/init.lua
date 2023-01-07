local servers = {
    "sumneko_lua",
    "cssls",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "cmake",
    "verible",
    "rust_analyzer",
    "lemminx",
    "ltex",
}

require("user.lsp.lsp_internal").setup()
require("user.lsp.lspconfig").setup(servers)
require("user.lsp.mason").setup(servers)
require "user.lsp.null-ls"
require "user.lsp.lspsaga" --lspui
require "user.lsp.extra.clangd_extensions"
require "user.lsp.extra.jdtls"
