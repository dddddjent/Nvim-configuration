local pickers = require "telescope.pickers"
local finders = require "telescope.finders" -- Transform table / add a few keys
local conf = require("telescope.config").values
local actions = require "telescope.actions" -- All actions we can remap
local action_state = require "telescope.actions.state" -- Utility function to get picker/selection/line

local function make_cmd(...)
    local args = { ... }
    local num_args = #args

    local cmd = "fd "
    for i, arg in ipairs(args) do
        cmd = cmd .. arg .. ' '
    end
    return cmd
end

local function parse_result(inputString)
    local list = {}
    for line in inputString:gmatch("[^\n]+") do
        table.insert(list, line)
    end
    return list
end

-- Input: a table
local function show_result(result)
    -- for i, row in ipairs(result) do
    --     print(i .. ' ' .. row)
    -- end

    local ui = function(opts)
        opts = opts or {}
        pickers.new(opts, {
            -- Trigger UI
            prompt_title = "fd results",
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

                        local file_path = selection.value
                        vim.cmd(":e " .. file_path)
                    end)
                return true
            end,
        }):find() -- Where the picker is actually triggered
    end

    ui()
end

function SEARCH_FILE(...)
    local cmd = make_cmd(...)

    local handle = io.popen(cmd)
    local result = handle:read("*a")
    if result == nil then
        print("fd cmd with nil return!")
        return
    end
    handle:close()

    result = parse_result(result)

    show_result(result)
end

vim.cmd('command! -nargs=* FD lua SEARCH_FILE(<f-args>)')
