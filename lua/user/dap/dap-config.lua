require('user.dap.dap-languages.adapters')

-- require('dap.ext.vscode').json_decode = require 'json5'.parse
-- The load process is in whichkey.lua
-- local configs=require('user.dap.dap-languages.configs')
-- configs.configure()

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


local function file_exists(path)
    local file = io.open(path, "rb")
    if file then file:close() end
    return file ~= nil
end
if file_exists(vim.fn.getcwd() .. "/.vscode/launch.json") then
    require('dap.ext.vscode').load_launchjs(nil,
        {
            -- map the type fields in json to the dap's builtin configuration fields
            cppdbg = { 'c', 'cpp', 'rust' },
            codelldb = { 'c', 'cpp', 'rust', 'cu' },
        })
end
