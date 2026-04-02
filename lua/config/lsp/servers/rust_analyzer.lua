return {
    cmd = {
        "/root/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer",
    },
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
