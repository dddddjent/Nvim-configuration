require "user.task.keymaps"

local function file_exists(path)
    local file = io.open(path, "rb")
    if file then file:close() end
    return file ~= nil
end

local M = {}
local ui = function()
end
M.setup = function()
    local path = vim.fn.getcwd() .. "/.vscode/tasks.json"
    if file_exists(path) == false then
        ui = require("user.task.ui").setup({ { label = "No tasks.json" } })
        return
    end

    local obj = require("user.task.parse").get_object()

    ui = require("user.task.ui").setup(obj.tasks or { { label = "Where is the task?" } })
end
M.setup()

-- ui is a function above to be triggered
M.trigger_ui = function()
    ui()
end

return M
