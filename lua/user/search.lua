local pickers = require "telescope.pickers"
local finders = require "telescope.finders"            -- Transform table / add a few keys
local conf = require("telescope.config").values
local actions = require "telescope.actions"            -- All actions we can remap
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

local function show_result(result)
    require "fzf-lua".fzf_exec(result, {
        actions = {
            ['default'] = function(selected)
                vim.cmd(":e " .. selected[1])
            end
        },
        winopts = { height = 0.38, width = 0.4, row = 0.5 },
        fzf_opts = { ['--layout'] = 'reverse' },
    })
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

vim.cmd([[
function! MyArgComplete(ArgLead, CmdLine, CursorPos)
    let completions = ["-g","-i","--search-path"]
    let filtered_completions = []
    for completion in completions
        if match(completion, '^' . a:ArgLead) != -1
            call add(filtered_completions, completion)
        endif
    endfor

    return filtered_completions
endfunction
]])

vim.cmd('command! -nargs=* -complete=customlist,MyArgComplete FD lua SEARCH_FILE(<f-args>)')
