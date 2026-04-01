return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        file_types = { 'markdown' },
        padding = {
            -- Highlight to use when adding whitespace, should match background
            highlight = 'Normal',
        },
        latex = {
            enabled = false,
        },
        heading = {
            icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ' },
            -- icons = { '', '', '', '', '', '' },
            signs = { '󰫎 ' },
            -- width = 'block',
            width = 'full',
            left_pad = 1,
            -- left_margin = 1,
            right_pad = 1,
            border = false,
            -- Alway use virtual lines for heading borders instead of attempting to use empty lines
            border_virtual = true,
            -- Highlight the start of the border using the foreground highlight
            border_prefix = false,
            -- Used above heading for border
            above = '▄',
            -- Used below heading for border
            below = '▀',
            -- The 'level' is used to index into the list using a clamp
            -- Highlight for the heading icon and extends through the entire line
            backgrounds = {
                'RenderMarkdownH1Bg',
                'RenderMarkdownH2Bg',
                'RenderMarkdownH3Bg',
                'RenderMarkdownH4Bg',
                'RenderMarkdownH5Bg',
                'RenderMarkdownH6Bg',
            },
            -- The 'level' is used to index into the list using a clamp
            -- Highlight for the heading and sign icons
            foregrounds = {
                'RenderMarkdownH1',
                'RenderMarkdownH2',
                'RenderMarkdownH3',
                'RenderMarkdownH4',
                'RenderMarkdownH5',
                'RenderMarkdownH6',
            },
        },
    },
}
