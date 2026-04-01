return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        triggers = {
            { "<auto>", mode = "nxs" }, -- remove d and y fully
        },
        defer = function(ctx)
            return vim.list_contains({ "v", "V", "<C-V>" }, ctx.mode)
        end,
        delay = 0,
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
    },
    keys = {
        { "<leader>w", "<cmd>silent w!<CR>", desc = "Save", mode = "n" },
        { "<leader>q", "<cmd>silent q!<CR>", desc = "Quit", mode = "n" },
        { "<leader>4", "<cmd>silent qa!<CR>", desc = "Quit all", mode = "n" },
        { "<leader>c", "<cmd>silent Bdelete!<CR>", desc = "Close buffer", mode = "n" },
        { "<leader>h", "<cmd>nohlsearch<CR>", desc = "Close search highlight", mode = "n" },
        { "<leader><leader>", "<nop>", desc = "Quit which-key", mode = "n" },
        { "<leader>H", function()
            local file_name = vim.fn.expand("%")
            local cmd = "nohup firefox " .. file_name .. " &"
            local job = vim.fn.jobstart(cmd)
        end, desc = "HTML preview", mode = "n" },
    }
}
