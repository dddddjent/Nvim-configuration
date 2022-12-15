M = {}
function M.config(json_data)
    local configuration =
    {
        name = json_data.name or "LLDB",
        type = json_data.type or "codelldb",
        request = json_data.request or "launch",
        cwd = json_data.cwd or '${workspaceFolder}',
        stopOnEntry = json_data.stopOnEntry or false,
        stopAtEntry = json_data.stopAtEntry or false,
        args = json_data.args,
        MIMode = json_data.MIMode or 'gdb',
        miDebuggerPath = json_data.miDebuggerPath or '/usr/bin/gdb',
        setupCommands = json_data.setupCommands or {
            {
                description = "Enable pretty-printing for gdb",
                text = "-enable-pretty-printing",
                ignoreFailures = true
            }
        },
        pid = json_data.pid,
    }
    if json_data.request == "launch" then
        configuration.program = json_data.program or function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end
    end

    return configuration
end

return M
