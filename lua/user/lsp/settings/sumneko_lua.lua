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
        },
    },
    cmd = {
        'lua-language-server' .. (function() if vim.fn.has('win32') then return '.cmd' end end)()
    }
}
