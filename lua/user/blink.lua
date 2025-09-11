require("blink.cmp").setup({
    keymap = {
        -- ['<C-b>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        ['<CR>'] = { 'select_and_accept', 'fallback' },

        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },

        -- ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        -- ['<C-f>'] = { function()
        --     neocodeium.accept()
        -- end },

        ['<M-j>'] = { 'snippet_forward', 'fallback' },
        ['<M-k>'] = { 'snippet_backward', 'fallback' },
    },
    signature = {
        enabled = false,
    },
    sources = {
        default = { 'lsp', 'path', 'buffer' },
        per_filetype = {
            codecompanion = { "codecompanion" },
        }
    },
    enabled = function()
        return vim.bo.buftype ~= "prompt"
            and vim.bo.filetype ~= "DressingInput"
            and vim.b.completion ~= false
    end,
    completion = {
        accept = { auto_brackets = { enabled = true } },
        trigger = {
            show_on_blocked_trigger_characters =
            { ' ', '\n', '\t', ',', '{', '}', "'", '"' },
        },
        menu = {
            draw = {
                -- The default cursor line override priority is 10000,
                -- and kind_icon is 20000. This is to avoid the override
                -- to tailwind icons. But I don't need it. So either set
                -- this cursorline_priority to 20001 or set the kind_icon priority back to 0.
                -- cursorline_priority = 20001,
                components = {
                    kind_icon = {
                        highlight = function(ctx)
                            return { { group = ctx.kind_hl, priority = 0 } }
                        end
                    }
                },
                columns = {
                    { "kind_icon", },
                    { "label", },
                    { "kind",      "source_name", gap = 1 } },
            }
        }
    }
})
