local dap = require('dap')

M = {}

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

local function file_exists(path)
    local file = io.open(path, "rb")
    if file then file:close() end
    return file ~= nil
end

local function currentPath()
    local info = debug.getinfo(1, "S")
    local path = info.source
    path = string.sub(path, 2, -1)
    path = string.match(path, "^.*/")
    return path
end

function M.configure()
    if file_exists(vim.fn.getcwd() .. "/.nvim/config.json") then
        JSON = (loadfile(currentPath() .. "JSON.lua"))()
        io.input(vim.fn.getcwd() .. "/.nvim/config.json")
        local str = io.read("*a")
        local json_obj = JSON:decode(str)

        local config_index = 1
        local configuration = {}
        while json_obj[config_index] ~= nil do
            local json_data = json_obj[config_index]
            configuration[config_index] = {
                name = json_data.name or "Codelldb bin",
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
                configuration[config_index].program = json_data.program or function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end
            end
            config_index = config_index + 1
        end
        dap.configurations.cpp = configuration
    else
        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }
    end
    dap.configurations.c = dap.configurations.cpp
end

M.configure()
return M
