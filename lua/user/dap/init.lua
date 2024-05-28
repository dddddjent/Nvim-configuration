require "user.dap.adapters"
require "user.dap.dapui"
require "user.dap.dap-virtual-text"
require "user.dap.keymaps"

LOAD_LAUNCHJS = function()
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
                delve = {'go'},
            })
    end
end

-- Load automatically
LOAD_LAUNCHJS()
