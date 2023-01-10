return {
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
    cmd = {
        'rust-analyzer' .. (function() if vim.fn.has('win32') then return '.cmd' end end)()
    }
}
