return {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
            },
        },
    },
    cmd = {
        'pyright' .. (function() if vim.fn.has('win32') then return '.cmd' end end)()
    }
}
