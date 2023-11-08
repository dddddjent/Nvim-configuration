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
    -- for i, row in ipairs(result) do
    --     print(i .. ' ' .. row)
    -- end

    local ui = function(opts)
        opts = opts or {}
        pickers.new(opts, {
            -- Trigger UI
            prompt_title = "Projects",
            finder = finders.new_table {
                -- results = { "read", "blue" },
                results = result,
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = entry,
                        ordinal = entry,
                    }
                end
            },
            sorter = conf.generic_sorter(opts), -- To filter the results

            -- Define actions in UI
            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(
                    function()
                        actions.close(prompt_bufnr)
                        local selection = action_state.get_selected_entry() -- Still able to get state after closed

                        local project_name = selection.value
                        vim.cmd(":! tmuxinator s " .. project_name)
                        -- vim.cmd(":! echo " .. project_name)
                    end)
                return true
            end,
        }):find() -- Where the picker is actually triggered
    end

    ui()
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

    -- for line in pairs(result) do
    --     print(line)
    -- end
    --
    show_result(result)
end

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<M-s>", function() get_projects() end, opts)
