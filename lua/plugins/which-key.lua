return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        triggers = {
            { "<auto>", mode = "nxs" }, -- remove d and y fully
            { "t",      mode = "n" },   -- builtin `t{char}` needs an explicit trigger
        },
        defer = function(ctx)
            return vim.list_contains({ "v", "V", "<C-V>" }, ctx.mode)
        end,
        -- delay = 0,
        plugins = {
            presets = {
                operators = false, -- can only remove simple dd and yy
            }
        },
        win = {
            border = "rounded",       -- none, single, double, shadow
            padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
        },
        layout = {
            height = { min = 3, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 75 }, -- min and max width of the columns
        },
        spec = {
            { "<leader>m", group = "Markdown preview" },
            { "<leader>p", group = "Projects/Paste" },
            { "t",         group = "FzfLua" },
        },
    },
    keys = {
        { "<leader>w",        "<cmd>silent w!<CR>",         desc = "Save",                   mode = "n" },
        { "<leader>tc",       "<cmd>silent tab close!<CR>", desc = "Tab close",              mode = "n" },
        { "<leader>tn",       "<cmd>silent tab new<CR>",    desc = "Tab new",                mode = "n" },
        { "<leader>q",        "<cmd>silent q!<CR>",         desc = "Quit",                   mode = "n" },
        { "<leader>4",        "<cmd>silent qa!<CR>",        desc = "Quit all",               mode = "n" },
        { "<leader>c",        "<cmd>Bdelete!<CR>",          desc = "Close buffer",           mode = "n" },
        { "<leader>h",        "<cmd>nohlsearch<CR>",        desc = "Close search highlight", mode = "n" },
        { "<leader><leader>", "<nop>",                      desc = "Quit which-key",         mode = "n" },
        {
            "<leader>pC",
            function()
                local source = vim.fn.stdpath("config") .. "/.vscode"

                if not (vim.uv or vim.loop).fs_stat(source) then
                    vim.notify("Missing config .vscode directory", vim.log.levels.ERROR)
                    return
                end

                local result = vim.fn.system({ "cp", "-rf", source, vim.fn.getcwd() })
                if vim.v.shell_error ~= 0 then
                    vim.notify(result, vim.log.levels.ERROR)
                    return
                end

                vim.notify("Copied .vscode to project root", vim.log.levels.INFO)
            end,
            desc = "Copy .vscode setup",
            mode = "n"
        },
        { "<leader>pp", "<cmd>call mdip#MarkdownClipboardImage()<cr>", desc = "Paste an image in markdown", mode = "n" },
        { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>",              desc = "Lazygit",                    mode = "n" },
        { "<leader>u",  "<cmd>UndotreeToggle<cr>",                     desc = "Toggle UndoTree",            mode = "n" },
        { "<leader>9",  "1gt",                                         desc = "To tab 1",                   mode = "n" },
        { "<leader>0",  "2gt",                                         desc = "To tab 2",                   mode = "n" },
        {
            "<leader>H",
            function()
                local file_name = vim.fn.expand("%")
                local cmd = "nohup firefox " .. file_name .. " &"
                local job = vim.fn.jobstart(cmd)
            end,
            desc = "HTML preview",
            mode = "n"
        },
    }
}
