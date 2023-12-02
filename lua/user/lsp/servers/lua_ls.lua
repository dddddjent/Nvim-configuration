return {
    lspconfig = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
                completion = {
                    callSnippet = "Replace"
                },
                hint = {
                    enable = true,
                },
            },
        },
    },
    is_format_disabled = false,
}
