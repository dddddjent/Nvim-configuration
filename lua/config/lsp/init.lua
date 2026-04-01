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
    local default_capabilities = vim.lsp.protocol.make_client_capabilities()
    -- default_capabilities = require('blink.cmp').get_lsp_capabilities(default_capabilities)
    default_capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }
    default_capabilities.textDocument.completion.completionItem.snippetSupport = false

    for _, server_name in ipairs(servers) do
        cfg = require ("config.lsp.servers."..server_name)
        local default_opts = {
            capabilities = default_capabilities,
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
                -- local lsp_signature_disable = cfg.lsp_signature_disable or false
                -- if lsp_signature_disable == false then
                --     require"lsp_signature".on_attach({
                --         bind = true, -- This is mandatory, otherwise border config won't get registered.
                --         handler_opts = {
                --             border = "rounded",
                --             hi_parameter = "IncSearch",
                --         }
                --     }, bufnr)
                -- end
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
