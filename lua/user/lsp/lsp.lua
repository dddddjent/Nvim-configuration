local M = {}

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
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })

    -- inlay_hint
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            vim.lsp.inlay_hint.enable(false)
        end,
    })
end

local init_lspsaga = function()
    local saga = require('lspsaga')
    saga.setup({
        lightbulb = {
            virtual_text = false,
        },
        symbol_in_winbar = {
            enable = false,
        },
        rename = {
            keys = {
                quit = "<C-c>",
            }
        }
    })
end

local init_mason = function()
    require("mason").setup({
        ui = {
            border = "none",
            icons = {
                package_installed = "I",
                package_pending = "P",
                package_uninstalled = "U",
            },
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 16,
        pip = { upgrade_pip = true }
    })
end

local init_server = function(server_cfgs)
    local default_capabilities = vim.lsp.protocol.make_client_capabilities()
    -- default_capabilities = require"cmp_nvim_lsp".default_capabilities(default_capabilities)
    default_capabilities = require('blink.cmp').get_lsp_capabilities(default_capabilities)
    default_capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }
    default_capabilities.textDocument.completion.completionItem.snippetSupport = false

    local lspconfig = require"lspconfig"
    for server_name, cfg in pairs(server_cfgs) do
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
                        callback = vim.lsp.codelens.refresh,
                        buffer = bufnr,
                    })
                end
                local lsp_signature_disable = cfg.lsp_signature_disable or false
                if lsp_signature_disable == false then
                    require"lsp_signature".on_attach({
                        bind = true, -- This is mandatory, otherwise border config won't get registered.
                        handler_opts = {
                            border = "rounded",
                            hi_parameter = "IncSearch",
                        }
                    }, bufnr)
                end
            end,
        }
        local opts = vim.tbl_deep_extend("force", default_opts, cfg.lspconfig)

        lspconfig[server_name].setup(opts)
    end
end

M.setup = function(server_names)
    local server_names_filtered = {}
    local server_cfgs = {}
    for _, server_name in pairs(server_names) do
        server_cfgs[server_name] = {
            lspconfig = {},
            is_format_disabled = false,
            ensure_installed = true,
        }
        local file_exists, custom_cfg = pcall(require, "user.lsp.servers." .. server_name)
        if file_exists then
            server_cfgs[server_name] = vim.tbl_deep_extend("force", server_cfgs[server_name], custom_cfg)
        end

        if server_cfgs[server_name].ensure_installed == true then
            table.insert(server_names_filtered, server_name)
        end
    end

    init_internal()
    init_lspsaga()
    init_mason()
    init_server(server_cfgs)
    if OS == 'linux' then
        require("mason-lspconfig").setup{
            ensure_installed = { 'lua_ls' }
        }
    end
end

return M
