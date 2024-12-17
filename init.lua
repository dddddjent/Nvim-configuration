local function path_exists(path)
    ---@diagnostic disable-next-line: undefined-field
    local stat = vim.loop.fs_stat(path)
    return stat ~= nil
end

io.input(vim.fn.stdpath('config') .. "/.vscode/workspace.json")
local str = io.read("*a")
local default_workspace_json = vim.json.decode(str)

if path_exists(vim.fn.getcwd() .. "/.vscode/workspace.json") then
    io.input(vim.fn.getcwd() .. "/.vscode/workspace.json")
    str = io.read("*a")
end
WORKSPACE_JSON = vim.json.decode(str)
WORKSPACE_JSON = vim.tbl_deep_extend("force", default_workspace_json, WORKSPACE_JSON)

require"user.colorschemes"
require"user.plugins"
require"user.options"
require"user.keymaps"
require"user.lsp"
require"user.dap"
require"user.task"
require"user.session"
require"user.search"
require"user.autocommands"
