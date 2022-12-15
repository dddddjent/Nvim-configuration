require('user.dap.dap-languages.adapters')
local configs=require('user.dap.dap-languages.configs')
configs.configure()

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
