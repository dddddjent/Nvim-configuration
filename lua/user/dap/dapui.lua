local dap = require('dap')
local dapui = require('dapui')
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

require("dapui").setup({
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes",      size = 0.60 },
                { id = "breakpoints", size = 0.20 },
                { id = "watches",     size = 0.20 },
            },
            size = 40,     -- 40 columns
            position = "left",
        },
        {
            elements = {
                { id = "console", size = 0.6 },
                { id = "stacks",  size = 0.40 },
            },
            size = 0.25,     -- 25% of total lines
            position = "bottom",
        },
    },
    controls = {
        enabled = true,
        element = "console",
    },
})
local breakpoint = {
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = "",
}
vim.fn.sign_define("DapBreakpoint", breakpoint)
