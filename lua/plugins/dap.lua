local init_adapters = function()
    local dap = require('dap')
    dap.adapters.python = function(cb, config)
        if config.request == 'attach' then
            local port = (config.connect or config).port
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
                command = PYTHON_DEP_DIR .. '/python',
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
                return MISE_DEP_DIR .. "/codelldb/extension/adapter/codelldb"
            end)(),
            args = { "--port", "${port}" },
        }
    }

    dap.adapters.delve = function(callback, config)
        if config.mode == 'remote' and config.request == 'attach' then
            callback({
                type = 'server',
                host = config.host or '127.0.0.1',
                port = config.port or '38697'
            })
        else
            callback({
                type = 'server',
                port = '${port}',
                executable = {
                    command = MISE_DEP_DIR .. '/dlv',
                    args = { 'dap', '-l', '127.0.0.1:${port}', '--log', '--log-output=dap' },
                    detached = vim.fn.has("win32") == 0,
                }
            })
        end
    end
end

return {
    "mfussenegger/nvim-dap",
    config = function()
        init_adapters()
    end,
    keys = {
        { "<F5>",  "<Cmd>lua require'dap'.continue()<CR>",  desc = "Continue",  mode = { "n", "i" }, },
        { "<F6>",  "<Cmd>lua require'dap'.terminate()<CR>", desc = "Stop",      mode = { "n", "i" }, },
        { "<F9>",  "<Cmd>lua require'dap'.step_into()<CR>", desc = "Step into", mode = { "n", "i" }, },
        { "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", desc = "Step over", mode = { "n", "i" }, },
        {
            "<leader>dt",
            "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
            desc = "Toggle Breakpoint (with condition)"
        },
        { "<leader>d",  "<nop>",                                     desc = "Debug" },
        { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>",     desc = "Step Back" },
        { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>",      desc = "Continue" },
        { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor" },
        { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>",    desc = "Disconnect" },
        { "<leader>dg", "<cmd>lua require'dap'.session()<cr>",       desc = "Get Session" },
        { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>",     desc = "Step Into" },
        { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>",     desc = "Step Over" },
        { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>",      desc = "Step Out" },
        { "<leader>dp", "<cmd>lua require'dap'.pause()<cr>",         desc = "Pause" },
        { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>",      desc = "Start" },
        { "<leader>dq", "<cmd>lua require'dap'.close()<cr>",         desc = "Quit" },
        { "<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>",      desc = "Toggle UI" },
        {
            "<leader>de",
            function()
                local cmd = "echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope"
                vim.cmd("ToggleTerm direction=float")
                vim.cmd("TermExec cmd=" .. "'" .. cmd .. "'")
            end,
            desc = "Enable the attach privilege"
        },
        { "<leader>1", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
    }
}
