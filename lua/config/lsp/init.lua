local servers = {
    "lua_ls",
    "basedpyright",
    "cmake",
    "hyprls",
    "rust_analyzer",
    "clangd",
    "glsl_analyzer",
    "gopls",
    "html",
    "jsonls",
    "lemminx",
    "bashls",
    "jsonls",
    "yamlls",
    "marksman",
    "zls",
    "taplo",
    "texlab",
    "html",
    "cssls",
    "eslint",
    "dockerls",
    "docker_compose_language_service",
    "vtsls",
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

    -- inlay_hint + gopls semantic token highlight links
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            vim.lsp.inlay_hint.enable(false)

            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if not client or client.name ~= "gopls" then
                return
            end

            local stp = client.server_capabilities.semanticTokensProvider
            local legend = stp and stp.legend
            if not legend then
                return
            end

            local function hl_default(group, link)
                vim.api.nvim_set_hl(0, group, { link = link, default = true })
            end

            local type_map = {
                namespace = "Identifier",
                type = "Type",
                typeParameter = "Type",
                parameter = "Identifier",
                variable = "Identifier",
                ["function"] = "Function",
                method = "Function",
                macro = "Macro",
                keyword = "Keyword",
                comment = "Comment",
                string = "String",
                number = "Number",
                operator = "Operator",
                label = "Label",
            }

            local ft = vim.bo[args.buf].filetype
            for _, token_type in ipairs(legend.tokenTypes or {}) do
                local link = type_map[token_type] or "Identifier"
                hl_default(string.format("@lsp.type.%s.%s", token_type, ft), link)

                for _, modifier in ipairs(legend.tokenModifiers or {}) do
                    hl_default(string.format("@lsp.typemod.%s.%s.%s", token_type, modifier, ft), link)
                end
            end
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

    local default_cfg = { format = true, enable_codelens = false }
    for _, server_name in ipairs(servers) do
        local cfg = require("config.lsp.servers." .. server_name)
        cfg = vim.tbl_deep_extend("force", default_cfg, cfg)
        local default_opts = {
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                if not cfg.format then --! Custom flag!
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
