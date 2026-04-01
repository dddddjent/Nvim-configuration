return {
    'saghen/blink.cmp',
    -- use a release tag to download pre-built binaries
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = 'default',
            ['<C-e>'] = { 'hide' },
            ['<CR>'] = { 'select_and_accept', 'fallback' },

            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },

            ['<M-j>'] = { 'snippet_forward', 'fallback' },
            ['<M-k>'] = { 'snippet_backward', 'fallback' },
        },
        signature = {
            enabled = true,
        },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'buffer' },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" },
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
    },
    opts_extend = { "sources.default" }
}
