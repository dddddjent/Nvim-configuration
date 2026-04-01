local servers = {
    "lua_ls"
}

local init_internal = function()
    -- Signs
    local signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.HINT] = "H",
            [vim.diagnostic.severity.INFO] = "I",
        },
    }

    -- Diagnostic
    vim.diagnostic.config({
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            border = "rounded",
        },
        signs = signs,
    })

    -- Hover ui
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.buf.hover({
        border = "rounded",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.signature_help({
        border = "rounded",
    })

    -- inlay_hint
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            vim.lsp.inlay_hint.enable(false)
        end,
    })
end

local init_server = function(servers)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- default_capabilities = require('blink.cmp').get_lsp_capabilities(default_capabilities)
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }
    capabilities.textDocument.completion.completionItem.snippetSupport = false

    for _, server_name in ipairs(servers) do
        cfg = require("config.lsp.servers." .. server_name)
        local default_opts = {
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                if cfg.is_format_disabled then
                    client.server_capabilities.documentFormattingProvider = false
                end

                if cfg.enable_codelens then
                    local codelens = vim.api.nvim_create_augroup(
                        'LSPCodeLens',
                        { clear = true }
                    )
                    vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave', 'CursorHold' }, {
                        group = codelens,
                        callback = function()
                            vim.lsp.codelens.enable(true)
                        end,
                        buffer = bufnr,
                    })
                end
            end,
        }
        local opts = vim.tbl_deep_extend("force", default_opts, cfg)

        vim.lsp.config(server_name, opts)
        vim.lsp.enable(server_name)
    end
end

init_internal()
init_server(servers)
require("config.lsp.keymaps")
