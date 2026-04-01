return {
    'nvimdev/lspsaga.nvim',
    opts = {
        lightbulb = {
            virtual_text = false,
        },
        symbol_in_winbar = {
            enable = false,
        },
        rename = {
            keys = {
                quit = "<C-c>",
            }
        }
    },
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
}
