local pickers = require "telescope.pickers"
local finders = require "telescope.finders"            -- Transform table / add a few keys
local conf = require("telescope.config").values
local actions = require "telescope.actions"            -- All actions we can remap
local action_state = require "telescope.actions.state" -- Utility function to get picker/selection/line

local function parse_result(inputString)
    local list = {}
    for line in inputString:gmatch("[^\n]+") do
        table.insert(list, line)
    end
    return list
end

local function show_result(result)
    require "fzf-lua".fzf_exec(result, {
        actions = {
            ['default'] = function(selected)
                vim.cmd(":silent ! tmuxinator s " .. selected[1])
            end
        },
        winopts = { height = 0.38, width = 0.4, row = 0.5 },
        fzf_opts = { ['--layout'] = 'reverse' },
    })
end

local function get_projects()
    local handle = io.popen("tmuxinator list -n | tail -n +2")
    local result = handle:read("*a")
    if result == nil then
        print("tmuxinator no return?")
        return
    end
    handle:close()

    result = parse_result(result)

    show_result(result)
end

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<M-s>", function() get_projects() end, opts)
