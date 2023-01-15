local M = {}

M.get_object = function()
    io.input(vim.fn.getcwd() .. "/.vscode/tasks.json")
    local str = io.read("*a")
    local json_obj = require 'json5'.parse(str)

    return json_obj
end

return M
