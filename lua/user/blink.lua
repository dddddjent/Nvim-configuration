local neocodeium = require("neocodeium")

require("blink.cmp").setup({
    keymap = {
        -- ['<C-b>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        ['<CR>'] = { 'select_and_accept', 'fallback' },

        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },

        -- ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { function()
            neocodeium.accept()
        end },

        ['<M-j>'] = { 'snippet_forward', 'fallback' },
        ['<M-k>'] = { 'snippet_backward', 'fallback' },
    },
    accept = { auto_brackets = { enabled = true } },
    signature = {
        enabled = false,
    },
    sources = {
        completion = {
            enabled_providers = { 'lsp', 'path', 'buffer' },
        }
    },
    completion = {
        trigger = {
            show_on_blocked_trigger_characters =
            { ' ', '\n', '\t', ',', '{', '}', "'", '"' },
        },
        menu = {
            draw = {
                columns = {
                    { "kind_icon" },
                    { "label", },
                    { "kind",     "source_name", gap = 1 } },
            }
        }
    }
})
