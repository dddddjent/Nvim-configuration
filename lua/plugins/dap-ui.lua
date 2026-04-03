local breakpoint = {
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
}
vim.fn.sign_define("DapBreakpoint", breakpoint)

return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    opts = {
        layouts = {
            {
                elements = {
                    -- Elements can be strings or table with id and size keys.
                    { id = "scopes",      size = 0.60 },
                    { id = "breakpoints", size = 0.20 },
                    { id = "watches",     size = 0.20 },
                },
                size = 40, -- 40 columns
                position = "left",
            },
            {
                elements = {
                    { id = "console", size = 0.6 },
                    { id = "stacks",  size = 0.40 },
                },
                size = 0.25, -- 25% of total lines
                position = "bottom",
            },
        },
        controls = {
            enabled = true,
            element = "console",
        },
    },
    config = function(_, opts)
        local dap, dapui = require("dap"), require("dapui")

        dapui.setup(opts)

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end,
    keys = {
        mode = "n",
        { "J",            "<Cmd>lua require('dapui').eval()<CR>", desc = "Eval current variable", },
        { "<RightMouse>", "<Cmd>lua require('dapui').eval()<CR>", desc = "Eval current variable", },
        { "<leader>dU",   "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI", },
    }
}
