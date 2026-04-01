return
{
    'lervag/vimtex',
    lazy = false,
    init = function()
        vim.cmd('syntax enable')
        vim.g.vimtex_view_method = 'zathura'
        vim.g.vimtex_fold_enabled = 1
        vim.g.vimtex_format_enabled = 1
        vim.g.vimtex_compile_method = 'latex-mk'
    end,
    keys = {
        mode = "n",
        group = 'VimTeX',
        { '<leader>vc', '<Plug>(vimtex-compile)', desc = 'Compile LaTeX' },
        { '<leader>vi', '<Plug>(vimtex-info)', desc = 'Info' },
        { '<leader>vs', '<cmd>VimtexView<cr>', desc = 'Sychronize' },
    },
}
