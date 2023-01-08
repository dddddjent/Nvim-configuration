local M = {}

M.get_object = function()
    io.input(vim.fn.getcwd() .. "/.vscode/Tasks.json")
    local str = io.read("*a")
    local json_obj = vim.json.decode(str)

    return json_obj
end

return M
