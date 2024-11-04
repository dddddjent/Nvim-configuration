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

    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup{
                mapping = { "kj", "jk", }, -- a table with mappings to use
                timeout = 200,             -- the time in which the keys must be hit in ms. Use option timeoutlen by default
                clear_empty_lines = false, -- clear line after escaping if there is only whitespace
                keys = "<Esc>",            -- keys used for escaping, if it is a function will use the result everytime
            }
        end,
    },
})
