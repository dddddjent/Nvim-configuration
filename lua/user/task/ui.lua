local pickers = require "telescope.pickers"
local finders = require "telescope.finders"            -- Transform table / add a few keys
local conf = require("telescope.config").values
local actions = require "telescope.actions"            -- All actions we can remap
local action_state = require "telescope.actions.state" -- Utility function to get picker/selection/line

local M = {}

M.setup = function(tasks)
    return function()
        local task_labels = {}
        for _, task in pairs(tasks) do
            vim.list_extend(task_labels, { task.label })
        end
        require "fzf-lua".fzf_exec(task_labels, {
            actions = {
                ['default'] = function(selected)
                    for _, task in pairs(tasks) do
                        if task.label == selected[1] then
                            require("user.task.process").process(task)
                            break
                        end
                    end
                end
            },
            winopts = { height = 0.38, width = 0.4, row = 0.5 },
            fzf_opts = { ['--layout'] = 'reverse' },
        })
    end
end
return M
