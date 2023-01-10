return {
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
            cmd = (function()
                if OS == "windows" then
                    return {
                        'lua-language-server.cmd'
                    }
                else
                    return nil
                end
            end)()
        },
    },
}
