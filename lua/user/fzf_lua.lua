local rg_cmd = vim.fn.stdpath('config') .. '/bin/rg'
if OS == 'windows' then
    rg_cmd = vim.fn.stdpath('config') .. '/bin/rg.exe'
end

require("fzf-lua").setup({ "telescope" })

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
                cmd = "fd",
                previewer = false,
                winopts = { height = 0.38, width = 0.4, row = 0.5 },
                fzf_opts = { ['--layout'] = 'reverse' },
            })
        end,
        "Find files",
    },
}, WHICH_KEY_OPTS)
