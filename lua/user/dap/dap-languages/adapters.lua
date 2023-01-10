local dap = require('dap')
dap.adapters.python = {
    type = 'executable';
    command = 'python';
    args = { '-m', 'debugpy.adapter' };
}
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/ljl/.local/share/nvim/mason/bin/OpenDebugAD7',
}
dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        -- CHANGE THIS to your path!
        -- command = '/usr/bin/codelldb',
        command = (function()
            if vim.fn.has('win32') then return 'codelldb.cmd'
            else return '/usr/bin/codelldb'
            end
        end)(),
        args = { "--port", "${port}" },
    }
}
