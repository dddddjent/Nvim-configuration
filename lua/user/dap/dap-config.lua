require('user.dap.dap-languages.cpp')
require('user.dap.dap-languages.rust')
require('user.dap.dap-languages.python')
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
