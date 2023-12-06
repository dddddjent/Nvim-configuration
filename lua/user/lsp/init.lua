local servers = {
    "lua_ls",
    "pyright",
    "ruff_lsp",
    "bashls",
    "jsonls",
    "yamlls",
    "cmake",
    "lemminx",
    "marksman",
    "bufls",
    "zls",
    "texlab",
    "svlangserver",
    "tsserver",
    "html",
    "cssls",
    "eslint",
    "taplo",
    "rust_analyzer",
    "clangd",
}

local null_ls_servers = {
    "isort",
    "mypy",
    "clang-format",
    "prettierd",
    "latexindent",
    "buf",
    "protolint",
    "markdown-toc",
    "codelldb",
    "debugpy",
}

require "user.lsp.lsp".setup(servers)
require "user.lsp.null-ls".setup()
require "user.lsp.keymaps"

-- for _, server_name in pairs(null_ls_servers) do
--     local pkg = require("mason-registry").get_package(server_name)
--     if not pkg:is_installed() then
--         pkg:install()
--     end
-- end
