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
        command = '/usr/bin/codelldb',
        args = { "--port", "${port}" },
    }
}
