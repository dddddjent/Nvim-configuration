local dap = require('dap')
dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or '127.0.0.1'
        cb({
            type = 'server',
            port = assert(port, '`connect.port` is required for a python `attach` configuration'),
            host = host,
            options = {
                source_filetype = 'python',
            },
        })
    else
        cb({
            type = 'executable',
            command = 'python',
            args = { '-m', 'debugpy.adapter' },
            options = {
                source_filetype = 'python',
            },
        })
    end
end

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        -- CHANGE THIS to your path!
        -- command = '/usr/bin/codelldb',
        command = (function()
            if OS == "windows" then
                return 'codelldb.cmd'
            else
                return '/home/ljl/.local/share/nvim/mason/bin/codelldb'
            end
        end)(),
        args = { "--port", "${port}" },
    }
}

dap.adapters.go = { -- install delve and vscode's dap impl (vscode-go)
    type = 'executable',
    command = 'go-debug-adapter',
}
