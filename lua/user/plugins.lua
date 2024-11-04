vim.loader.enable()
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup({
    {
        'saghen/blink.cmp',
        lazy = false,
        dependencies = 'rafamadriz/friendly-snippets',
        version = 'v0.*',
        opts = {
            keymap = {
                ['<C-e>'] = { 'hide' },
                ['<CR>'] = { 'select_and_accept', 'fallback' },

                ['<C-k>'] = { 'select_prev', 'fallback' },
                ['<C-j>'] = { 'select_next', 'fallback' },

                ['<M-j>'] = { 'snippet_forward', 'fallback' },
                ['<M-k>'] = { 'snippet_backward', 'fallback' },
            },
            highlight = {
                use_nvim_cmp_as_default = true,
            },
            nerd_font_variant = 'mono',
            accept = { auto_brackets = { enabled = false } },
            trigger = {
                signature_help = { enabled = false },
                completion = {
                    show_in_snippet = true,
                }
            },
        },
    },

    { "neovim/nvim-lspconfig", },
})
