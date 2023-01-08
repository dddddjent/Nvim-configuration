local dap = require('dap')

M = {}

local module_path = "user.dap.dap-languages."

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
    if file_exists(vim.fn.getcwd() .. "/.vscode/debug.json") then
        io.input(vim.fn.getcwd() .. "/.vscode/debug.json")
        local str = io.read("*a")
        local json_obj = vim.json.decode(str)

        local config_index = 1
        local configuration = {}
        while json_obj[config_index] ~= nil do
            local json_data = json_obj[config_index]
            if json_data.type == "codelldb" or json_data.type == "cppdbg" then
                configuration[config_index] = require(module_path .. 'cpp').config(json_data)
            elseif json_data.type == "python" then
                configuration[config_index] = require(module_path .. 'python').config(json_data)
            end
            config_index = config_index + 1
        end
        dap.configurations.cpp = configuration
        dap.configurations.python = configuration

    else -- No JSON file
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
        dap.configurations.python = {
            program = "${file}"; -- This configuration will launch the current file if used.
            pythonPath = function()
                -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                local cwd = vim.fn.getcwd()
                if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                    return cwd .. '/venv/bin/python'
                elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                    return cwd .. '/.venv/bin/python'
                else
                    return '/usr/bin/python'
                end
            end
        }
    end
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
end

return M
