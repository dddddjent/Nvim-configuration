return {
    cmd = {
        'lemminx' .. (function() if vim.fn.has('win32') then return '.cmd' end end)()
    }
}
