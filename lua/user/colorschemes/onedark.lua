require("onedarkpro").setup({
    colors = {
        onedark = {
            -- bg = "#202123",
            -- yellow = "#D7C893",
            -- yellow = "#e5c76b",
            -- green = "#8ccf7e",
            -- red = "#ef7e7e",
            -- blue = "#67b0e8",
            bg = "#15191f",
            yellow = "#e5c76b",
            green = "#8ccf7e",
            blue = "#ef7e7e",
            purple = "#67b0e8",
            white = "#dadada",
            gray = "#b3b9b8",
            inlay_hint = "#505759",
            cyan = "#6cbfbf",
            bg_statusline = "#15191f"
        },
        -- cursorline = "#36383c",
    },
    highlights = {
        WhichKeyFloat = { bg = "#15191f" },
        DiagnosticUnderlineError = { sp = "${red}", style = "undercurl" },
        DiagnosticUnderlineWarn = { sp = "${yellow}", style = "undercurl" },
        DiagnosticUnderlineInfo = { sp = "${purple}", style = "undercurl" },
        DiagnosticUnderlineHint = { sp = "${cyan}", style = "undercurl" },
    },
})

return {
    post_set_scheme = function()
        local cmd = vim.cmd
        -- cmd "hi @property guifg=#C0BAC7"
        cmd "hi @lsp.type.macro.cpp guifg=#A09A29"
        -- cmd "hi Type guifg=#C678DD"
        -- cmd "hi @parameter guifg=#ABB2BF"
        -- cmd "hi @PreProc guifg=#E5C07B"
        -- cmd "hi @variable.builtin guifg=@variable"
        -- cmd "hi Include guifg=#E5C07B"
        -- cmd "hi Define guifg=#E5C07B"
        -- cmd "hi @lsp.typemod.function.defaultLibrary.cpp guifg=#61AFEF"
        -- cmd "hi @storageclass.cpp guifg=#C678DD"

        cmd "hi @namespace guifg=#ef7e7e"
        cmd "hi @lsp.typemod.property.declaration guifg=#ef7e7e"
        cmd "hi @lsp.typemod.property.classScope guifg=#ef7e7e"
        cmd "hi @lsp.typemod.unknown.classScope guifg=#ef7e7e"
        cmd "hi @lsp.typemod.method.defaultLibrary guifg=#ef7e7e"
        cmd "hi @variable guifg=#b3b9b8"
        cmd "hi @parameter guifg=#b3b9b8"
        cmd "hi @property guifg=#b3b9b8"
        cmd "hi CursorLineNr guifg=#b3b9b8"
        cmd "hi @storageclass.cpp guifg=#67b0e8"
        cmd "hi @variable.cmake guifg=#67b0e8"
        cmd "hi @PreProc guifg=#67b0e8"
        cmd "hi @type.qualifier guifg=#67b0e8"
        cmd "hi @variable.builtin guifg=#67b0e8"
        cmd "hi @Constant guifg=#6cbfbf"
        cmd "hi Boolean guifg=#6cbfbf"
        cmd "hi Number guifg=#e5c76b"
        cmd "hi @lsp.type.typeParameter guifg=#e5c76b"
        cmd "hi @lsp.type.struct guifg=#e5c76b"
        cmd "hi Comment guifg=#505759"
        cmd "hi PmenuSel guibg=#304759"
        cmd "hi WhichKeyBorder guibg=#15191f"
        cmd "hi RainbowDelimiterRed guifg=#ef7e7e"
        cmd "hi RainbowDelimiterBlue guifg=#67b0e8"
        cmd "hi RainbowDelimiterYellow guifg=#f4d67a"
        cmd "hi RainbowDelimiterOrange guifg=#e5c76b"
        cmd "hi RainbowDelimiterGreen guifg=#8ccf7e"
        cmd "hi RainbowDelimiterViolet guifg=#c47fd5"
        cmd "hi RainbowDelimiterCyan guifg=#6cbfbf"
        cmd "hi NormalFloat guibg=#15191f"
        cmd "hi FloatBorder guibg=#15191f"
        cmd "hi SagaCount guifg=white guibg=#15191f gui=bold"
    end
}
