M = {}
function M.config(json_data)
    local configuration =
    {
        name = json_data.name or "Python debug",
        type = json_data.type or "python",
        request = json_data.request or "launch",
        program = json_data.program or "${file}"; -- This configuration will launch the current file if used.
        cwd = json_data.cwd or '${workspaceFolder}',
        stopOnEntry = json_data.stopOnEntry or false,
        stopAtEntry = json_data.stopAtEntry or false,
        args = json_data.args,
        pid = json_data.pid,
        pythonPath = json_data.pythonPath or function()
            -- debugpy
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            else
                return '/usr/bin/python'
            end
        end;
    }

    return configuration
end

return M
