local keymap = vim.keymap.set
keymap({ "n", "i" }, "<F5>", "<Cmd>lua require'dap'.continue()<CR>", KEY_OPTS)
keymap({ "n", "i" }, "<F6>", "<Cmd>lua require'dap'.terminate()<CR>", KEY_OPTS)
keymap({ "n", "i" }, "<F9>", "<Cmd>lua require'dap'.step_into()<CR>", KEY_OPTS)
keymap({ "n", "i" }, "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", KEY_OPTS)
keymap("n", "J", "<Cmd>lua require('dapui').eval()<CR>", KEY_OPTS)
keymap("n", "<RightMouse>", "<Cmd>lua require('dapui').eval()<CR>", KEY_OPTS)

require "which-key".register({
    ["1"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    d = {
        name = "Debug",
        t = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
            "Toggle Breakpoint (with condition)" },
        b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
        c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
        C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
        d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
        g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
        i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
        o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
        u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
        p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
        r = { "<cmd>lua require'user.task'.configure()<cr>", "Reload Tasks.json" },
        s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
        q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
        U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
        R = { function()
            LOAD_LAUNCHJS()
        end, "Reload launch.json" },
        e = { function()
            local cmd = "echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope"
            vim.cmd("ToggleTerm direction=float")
            vim.cmd("TermExec cmd=" .. "'" .. cmd .. "'")
        end, "Enable the attach privilege" },
    },
}, WHICH_KEY_OPTS)
