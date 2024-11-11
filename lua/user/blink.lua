require("blink.cmp").setup({
    keymap = {
        -- ['<C-b>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        ['<CR>'] = { 'select_and_accept', 'fallback' },

        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },

        -- ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        -- ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

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
    sources = {
        completion = {
            enabled_providers = { 'lsp', 'path', 'buffer' },
        }
    },
    windows = {
        autocomplete = {
            draw = {
                columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind"} },
            }
        }
    }
})
