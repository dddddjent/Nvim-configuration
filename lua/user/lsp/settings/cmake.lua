return {
    cmd = {
        'cmake-language-server' .. (function() if vim.fn.has('win32') then return '.cmd' end end)()
    }
}
