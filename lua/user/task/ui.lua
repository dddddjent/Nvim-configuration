local pickers = require "telescope.pickers"
local finders = require "telescope.finders" -- Transform table / add a few keys
local conf = require("telescope.config").values
local actions = require "telescope.actions" -- All actions we can remap
local action_state = require "telescope.actions.state" -- Utility function to get picker/selection/line

local M = {}

M.setup = function(tasks)
    -- our picker function: colors
    return function(opts)
        opts = opts or {}
        pickers.new(opts, {
            prompt_title = "Tasks",
            finder = finders.new_table {
                -- results = { "read", "blue" },
                results = tasks,
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = entry.label or "Please add label!",
                        ordinal = entry.label or "Please add label!",
                    }
                end
            },
            sorter = conf.generic_sorter(opts), -- To filter the results

            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(
                    function()
                        actions.close(prompt_bufnr)
                        local selection = action_state.get_selected_entry() -- Still able to get state after closed

                        require("user.task.process").process(selection.value)
                        -- print(vim.inspect(selection))
                    end)
                return true
            end,
        }):find() -- Where the picker is actually triggered
    end
end


return M
