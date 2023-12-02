vim.cmd('syntax enable')
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_fold_enabled = 1
vim.g.vimtex_format_enabled = 1
vim.g.vimtex_compile_method = 'latex-mk'

require "which-key".register({
    v = {
        name = "Vimtex",
        c = { "<Plug>(vimtex-compile)", "Compile latex file" },
        i = { "<Plug>(vimtex-info)", "Info" },
        s = { "<cmd>VimtexView<cr>", "Sychronize" },
    },
}, WHICH_KEY_OPTS)
