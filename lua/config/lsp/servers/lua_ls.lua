return {
    cmd = { MISE_DEP_DIR .. "/lua-language-server/latest/bin/lua-language-server" },
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
}
