return {
    settings={
        ltex={
            completionEnabled=true,
        }
    },
    cmd = {
        'ltex-ls' .. (function() if vim.fn.has('win32') then return '.cmd' end end)()
    }
}
