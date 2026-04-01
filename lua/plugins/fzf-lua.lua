local function split_files(first_file, second_file)
    vim.cmd.tabnew(first_file)
    vim.cmd("vertical diffsplit " .. second_file)
    vim.cmd.normal({ args = { "gg" }, bang = true })
end
local function diff_current()
    local current_filepath = vim.fn.expand(vim.api.nvim_buf_get_name(vim.fn.bufnr()))
    require"fzf-lua".files({
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
    require"fzf-lua".files({
        cmd = "fd --hidden",
        previewer = false,
        winopts = { height = 0.38, width = 0.4, row = 0.5 },
        fzf_opts = { ['--layout'] = 'reverse' },
        actions = {
            ['default'] = function(selected1)
                local file_name1 = string.sub(selected1[1], 7, string.len(selected1[1]))
                require"fzf-lua".files({
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

return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        "telescope",
        keymap = {
            fzf = {
                ["alt-a"] = "select-all+accept",
                ["ctrl-j"] = "down",
                ["ctrl-k"] = "up",
            },
        },
        winopts = {
            on_create = function(e)
                -- called once upon creation of the fzf main window
                -- can be used to add custom fzf-lua mappings, e.g:
                vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = e.bufnr })
                vim.keymap.set("t", "<C-k>", "<Up>", { silent = true, buffer = e.bufnr })
            end,
        },
    },
    keys = {
        { "tt", "<cmd>FzfLua<cr>", mode = "n", desc = "FzfLua" },
        {
            "th",
            function()
                require("fzf-lua").command_history()
            end,
            mode = "n",
            desc = "Command history"
        },
        {
            "tl",
            function()
                require("fzf-lua").live_grep({
                    cmd = "rg" ..
                        " --no-heading " ..
                        " --with-filename " ..
                        " --line-number " ..
                        " --column " ..
                        " --smart-case " ..
                        " --hidden " ..
                        " --glob=!.git/ " ..
                        " -g " .. "!**/.idea/**" ..
                        " -g " .. "!**/.cache/**" ..
                        " -g " .. "!**/.gitlab/**",
                })
            end,
            mode = "n",
            desc = "Live grep"
        },
        {
            "td",
            function()
                require("fzf-lua").diagnostics_workspace()
            end,
            mode = "n",
            desc = "Workspace diagnostics"
        },
        {
            "tb",
            function()
                require("fzf-lua").buffers()
            end,
            mode = "n",
            desc = "Buffers"
        },
        {
            "tg",
            function()
                require("fzf-lua").grep()
            end,
            mode = "n",
            desc = "Grep"
        },
        {
            "tr",
            function()
                require("fzf-lua").resume()
            end,
            mode = "n",
            desc = "Resume"
        },
        {
            "<leader>f",
            function()
                require("fzf-lua").files({
                    cmd = "fd --hidden --type file --exclude .git",
                    previewer = false,
                    winopts = { height = 0.38, width = 0.4, row = 0.5, col = 0.5 },
                    fzf_opts = { ["--layout"] = "reverse" },
                })
            end,
            mode = "n",
            desc = "Find files"
        },
        {
            "<leader>tc",
            function()
                diff_current()
            end,
            mode = "n",
            desc = "Telescope compare with current"
        },
        {
            "<leader>tC",
            function()
                diff_files()
            end,
            mode = "n",
            desc = "Telescope compare 2 files"
        },
    }
}
