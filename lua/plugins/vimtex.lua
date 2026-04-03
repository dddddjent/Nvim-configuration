return
{
    'lervag/vimtex',
    lazy = false,
    init = function()
        vim.cmd('syntax enable')

        vim.g.vimtex_view_method = 'general'
        vim.g.vimtex_view_general_viewer = '/etc/xdg/nvim/bin/zathura-vimtex'
        vim.g.vimtex_view_general_options = '--synctex-forward @line:@col:@tex @pdf'
        vim.g.vimtex_fold_enabled = 1
        vim.g.vimtex_format_enabled = 1
        vim.g.vimtex_compiler_method = 'latexmk'
    end,
    keys = {
        mode = "n",
        group = 'VimTeX',
        { '<leader>vc', '<Plug>(vimtex-compile)', desc = 'Compile LaTeX' },
        { '<leader>vi', '<Plug>(vimtex-info)', desc = 'Info' },
        { '<leader>vs', '<cmd>VimtexView<cr>', desc = 'Sychronize' },
    },
}
