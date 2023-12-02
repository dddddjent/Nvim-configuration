require "user.dap.adapters"
require "user.dap.dapui"
require "user.dap.dap-virtual-text"

-- Load automatically
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
