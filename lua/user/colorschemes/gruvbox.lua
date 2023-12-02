require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    -- italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true,    -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {
        dark1 = "#1d2021",
    },
    dim_inactive = false,
    transparent_mode = false,
    overrides = {
        CursorLine = { bg = "#3c3836" },
        Pmenu = { bg = "#1d2021" },
        LspSignatureActiveParameter = { fg = "#d79921" },
    }
})

return {
    post_set_scheme = function()
        vim.cmd "hi @namespace guifg=#458588"
    end
}

