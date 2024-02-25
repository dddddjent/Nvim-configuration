require "user.task.keymaps"

local function file_exists(path)
    local file = io.open(path, "rb")
    if file then file:close() end
    return file ~= nil
end

local M = {}

-- ui is a function above to be triggered
local ui = function()
end
M.trigger_ui = function()
    local path = vim.fn.getcwd() .. "/.vscode/tasks.json"
    if file_exists(path) == false then
        ui = require("user.task.ui").setup({ { label = "No tasks.json" } })
        return
    end

    local obj = require("user.task.parse").get_object()

    ui = require("user.task.ui").setup(obj.tasks or { { label = "Where is the task?" } })
    ui()
end

return M
