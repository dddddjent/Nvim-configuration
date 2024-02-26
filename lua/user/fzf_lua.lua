local rg_cmd = vim.fn.stdpath('config') .. '/bin/rg'
if OS == 'windows' then
    rg_cmd = vim.fn.stdpath('config') .. '/bin/rg.exe'
end

require("fzf-lua").setup({ "telescope" })

local function split_files(first_file, second_file)
    vim.cmd.tabnew(first_file)
    vim.cmd("vertical diffsplit " .. second_file)
    vim.cmd.normal({ args = { "gg" }, bang = true })
end
local function diff_current()
    local current_filepath = vim.fn.expand(vim.api.nvim_buf_get_name(vim.fn.bufnr()))
    require "fzf-lua".files({
        cmd = "fd --hidden",
        previewer = false,
        winopts = { height = 0.38, width = 0.4, row = 0.5 },
        fzf_opts = { ['--layout'] = 'reverse' },
        actions = {
            ['default'] = function(selected)
                local file_name = string.sub(selected[1], 7, string.len(selected[1]))
                split_files(current_filepath, file_name)
            end
        },
    })
end
local function diff_files()
    require "fzf-lua".files({
        cmd = "fd --hidden",
        previewer = false,
        winopts = { height = 0.38, width = 0.4, row = 0.5 },
        fzf_opts = { ['--layout'] = 'reverse' },
        actions = {
            ['default'] = function(selected1)
                local file_name1 = string.sub(selected1[1], 7, string.len(selected1[1]))
                require "fzf-lua".files({
                    cmd = "fd --hidden",
                    previewer = false,
                    winopts = { height = 0.38, width = 0.4, row = 0.5 },
                    fzf_opts = { ['--layout'] = 'reverse' },
                    actions = {
                        ['default'] = function(selected2)
                            local file_name2 = string.sub(selected2[1], 7, string.len(selected2[1]))
                            split_files(file_name1, file_name2)
                        end
                    },
                })
            end
        },
    })
end


local keymap = vim.keymap.set
keymap("n", "tt", "<cmd>FzfLua<cr>", KEY_OPTS)
keymap("n", "th", function()
    require "fzf-lua".command_history()
end, KEY_OPTS)
keymap("n", "tl", function()
    require "fzf-lua".live_grep(
        {
            cmd = rg_cmd ..
                " --no-heading " ..
                " --with-filename " ..
                " --line-number " ..
                " --column " ..
                " --smart-case " ..
                " --hidden " ..
                " --glob=!.git/ " ..
                " -g " .. "!**/.idea/**" ..
                " -g " .. "!**/.cache/**" ..
                " -g " .. "!**/.gitlab/**"
        }
    )
end, KEY_OPTS)
keymap("n", "td", function()
    require "fzf-lua".diagnostics_workspace()
end, KEY_OPTS)
keymap("n", "tb", function()
    require "fzf-lua".buffers()
end, KEY_OPTS)
keymap("n", "tg", function()
    require "fzf-lua".grep()
end, KEY_OPTS)
keymap("n", "tr", function()
    require "fzf-lua".resume()
end, KEY_OPTS)

require "which-key".register({
    ["f"] = {
        function()
            require "fzf-lua".files({
                cmd = "fd --hidden --type file",
                previewer = false,
                winopts = { height = 0.38, width = 0.4, row = 0.5 },
                fzf_opts = { ['--layout'] = 'reverse' },
            })
        end,
        "Find files",
    },
    ["t"] = {
        ["c"] = {
            function()
                diff_current()
            end,
            "Telescope compare with current"
        },
        ["C"] = {
            function()
                diff_files()
            end,
            "Telescope compare 2 files"
        }
    }
}, WHICH_KEY_OPTS)
