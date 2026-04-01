return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        plugins = {
            presets = {
                operators = false,
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
        { "<leader>H", function()
            local file_name = vim.fn.expand("%")
            local cmd = "nohup firefox " .. file_name .. " &"
            local job = vim.fn.jobstart(cmd)
        end, desc = "HTML preview", mode = "n" },
    }
}
