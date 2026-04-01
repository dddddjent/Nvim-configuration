return {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                numbers = "none",                    -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
                close_command = "Bdelete! %d",       -- can be a string | function, see "Mouse actions"
                right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
                left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
                middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
                indicator_icon = nil,
                indicator = { style = 'icon', icon = "▎" },
                buffer_close_icon = "",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 13,
                max_prefix_length = 13, -- prefix used when a buffer is de-duplicated
                tab_size = 15,
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " "
                            or (e == "warning" and " " or "i")
                        s = s .. n .. sym
                    end
                    return s
                end,
                offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
                show_buffer_icons = true,
                show_buffer_close_icons = false,
                show_close_icon = true,
                show_tab_indicators = true,
                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                separator_style = "slant",
                enforce_regular_tabs = true,
                always_show_bufferline = true,
            },
            highlights = {
                tab = {
                    fg = { attribute = "fg", highlight = "TabLine" },
                    bg = { attribute = "bg", highlight = "TabLine" },
                },
                tab_close = {
                    fg = { attribute = 'fg', highlight = 'LspDiagnosticsDefaultError' },
                    bg = { attribute = "bg", highlight = "Normal" },
                },
            },
        }
}
