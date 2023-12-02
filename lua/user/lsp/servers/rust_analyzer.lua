return {
    lspconfig = {
        settings = {
            ["rust-analyzer"] = {
                -- enable clippy on save
                -- checkOnSave = {
                --     command = "clippy",
                -- },
                imports = {
                    granularity = {
                        group = "module",
                    },
                    prefix = "self",
                },
                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                },
                procMacro = {
                    enable = true
                },
            },
        },
    }
}
