return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
        signs = {
            -- add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
            -- change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
            -- delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
            -- topdelete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
            -- changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
            add          = { text = '▎' },
            change       = { text = '▎' },
            delete       = { text = '▎' },
            topdelete    = { text = '▎' },
            changedelete = { text = '▎' },
            untracked    = { text = '▎' },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
            interval = 1000,
            follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
            -- Options passed to nvim_open_win
            border = "single",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
        },
    },
    keys = {
        group = "Git",
        mode = { "n" },
        { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>",    desc = "Next Hunk" },
        { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",    desc = "Prev Hunk" },
        { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>",   desc = "Blame" },
        { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
        { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",   desc = "Reset Hunk" },
        { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
        { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",   desc = "Stage Hunk" },
        { "<leader>gu",
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
        },
        { "<leader>go", "<cmd>FzfLua git_status<cr>",              desc = "Open changed file" },
        -- { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Checkout branch" },
        { "<leader>gb", "<cmd>lua require 'gitsigns'.blame()<cr>", desc = "Blame" },
        { "<leader>gc", "<cmd>FzfLua git_commits<cr>",             desc = "Checkout commit" },
        {
            "<leader>gd",
            "<cmd>Gitsigns diffthis HEAD<cr>",
            desc = "Diff",
        },
    }
}
