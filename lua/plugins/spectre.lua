return {
    'nvim-pack/nvim-spectre',
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {
        find_engine = {
            -- rg is map with finder_cmd
            ['rg'] = {
                args = {
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    "--glob=!.git/",
                },
            },
        },
        mapping = {
            ['run_current_replace'] = {
                map = "<leader>r",
                cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
                desc = "replace current line"
            },
        },
        find = {
            --pick one of item in find_engine
            options = {
                "ignore-case"
            }
        },
    }
}
