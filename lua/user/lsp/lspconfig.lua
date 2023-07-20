local servers = {
    "lua_ls",
    "cssls",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "cmake",
    "lemminx",
    -- "ltex",
    "marksman",
    "bufls",
    "zls",
    "texlab",
    "svlangserver"
}

local M = {}
function M.setup()
    local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_status_ok then
        return
    end

    -- setup servers
    local opts = {}
    for _, server in pairs(servers) do
        opts = {
            on_attach = require("user.lsp.handlers").on_attach,
            capabilities = require("user.lsp.handlers").capabilities,
        }

        server = vim.split(server, "@")[1]

        local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
        if require_ok then
            opts = vim.tbl_deep_extend("force", conf_opts, opts)
        end

        lspconfig[server].setup(opts)
    end
end

return M
