local palette = {
    color0     = '#232a2d',
    color1     = '#e57474',
    color2     = '#8ccf7e',
    color3     = '#e5c76b',
    color4     = '#67b0e8',
    color5     = '#c678dd',
    color6     = '#6cbfbf',
    color7     = '#b3b9b8',
    color8     = '#2d3437',
    color9     = '#ef7e7e',
    color10    = '#96d988',
    color11    = '#f4d67a',
    color12    = '#71baf2',
    color13    = '#ce89df',
    color14    = '#67cbe7',
    color15    = '#bdc3c2',
    comment    = '#505759',
    contrast   = '#0d1014',
    background = '#15191f',
    foreground = '#dadada',
    cursorline = '#2c3333',
    marcro     = '#A09A29',
    pmenusel   = '#304759',
    none       = 'NONE',
}

require("onedarkpro").setup({
    colors = {
        onedark = {
            bg = palette.background,
            yellow = palette.color3,
            green = palette.color2,
            blue = palette.color9,
            purple = palette.color4,
            white = palette.foreground,
            gray = palette.color7,
            inlay_hint = palette.comment,
            cyan = palette.color6,
            bg_statusline = palette.background
        },
    },
    highlights = {
        DiagnosticUnderlineError = { sp = "${red}", style = "undercurl" },
        DiagnosticUnderlineWarn = { sp = "${yellow}", style = "undercurl" },
        DiagnosticUnderlineInfo = { sp = "${purple}", style = "undercurl" },
        DiagnosticUnderlineHint = { sp = "${cyan}", style = "undercurl" },
    },
})

local render_markdown_colors = function()
    local api = vim.api
    api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = palette.background, bg = palette.color9 })
    api.nvim_set_hl(0, "RenderMarkdownH1", { fg = palette.color9, bg = palette.background })
    api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = palette.background, bg = palette.color5 })
    api.nvim_set_hl(0, "RenderMarkdownH2", { fg = palette.color5, bg = palette.background })
    api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = palette.background, bg = palette.color4 })
    api.nvim_set_hl(0, "RenderMarkdownH3", { fg = palette.color4, bg = palette.background })
    api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = palette.background, bg = palette.color6 })
    api.nvim_set_hl(0, "RenderMarkdownH4", { fg = palette.color6, bg = palette.background })

    -- api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = palette.color9, bg = palette.contrast })
    -- api.nvim_set_hl(0, "RenderMarkdownH1", { fg = palette.contrast, bg = palette.color9 })
    -- api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = palette.color5, bg = palette.contrast})
    -- api.nvim_set_hl(0, "RenderMarkdownH2", { fg = palette.contrast, bg = palette.color5 })
    api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = palette.color4, bg = palette.background})
    api.nvim_set_hl(0, "RenderMarkdownH3", { fg = palette.background, bg = palette.color4 })
    api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = palette.color6, bg = palette.background })
    api.nvim_set_hl(0, "RenderMarkdownH4", { fg = palette.background, bg = palette.color6 })

    api.nvim_set_hl(0, "RenderMarkdownCode", { bg = palette.contrast })
    api.nvim_set_hl(0, "RenderMarkdownCodeInline", { bg = palette.contrast })

    api.nvim_set_hl(0, "RenderMarkdownQuote", { bg = palette.contrast })
end

return {
    post_set_scheme = function()
        local api = vim.api
        api.nvim_set_hl(0, "@lsp.type.macro.cpp", { fg = palette.marcro })
        api.nvim_set_hl(0, "@lsp.type.typeParameter", { fg = palette.color3 })
        api.nvim_set_hl(0, "@lsp.type.struct", { fg = palette.color3 })
        api.nvim_set_hl(0, "@lsp.typemod.property.declaration", { fg = palette.color9 })
        api.nvim_set_hl(0, "@lsp.typemod.property.classScope", { fg = palette.color9 })
        api.nvim_set_hl(0, "@lsp.typemod.unknown.classScope", { fg = palette.color9 })
        api.nvim_set_hl(0, "@lsp.typemod.method.defaultLibrary", { fg = palette.color9 })
        api.nvim_set_hl(0, "LspCodeLens", { fg = palette.color8, italic = true })
        api.nvim_set_hl(0, "LspCodeLensText", { fg = palette.color15 })
        api.nvim_set_hl(0, "LspCodeLensSeparator", { fg = palette.color8 })
        api.nvim_set_hl(0, "SagaCount", { fg = palette.white, bg = palette.background, bold = true })

        api.nvim_set_hl(0, "Boolean", { fg = palette.color6 })
        api.nvim_set_hl(0, "Number", { fg = palette.color3 })
        api.nvim_set_hl(0, "Comment", { fg = palette.comment })
        api.nvim_set_hl(0, "@namespace", { fg = palette.color9 })
        api.nvim_set_hl(0, "@variable", { fg = palette.color7 })
        api.nvim_set_hl(0, "@variable.builtin", { fg = palette.color4 })
        api.nvim_set_hl(0, "@variable.go", { fg = palette.color7 })
        api.nvim_set_hl(0, "@variable.cmake", { fg = palette.color4 })
        api.nvim_set_hl(0, "@parameter", { fg = palette.color7 })
        api.nvim_set_hl(0, "@parameter.go", { fg = palette.color7 })
        api.nvim_set_hl(0, "@property", { fg = palette.color7 })
        api.nvim_set_hl(0, "@property.go", { fg = palette.color7 })
        api.nvim_set_hl(0, "@storageclass.cpp", { fg = palette.color4 })
        api.nvim_set_hl(0, "@PreProc", { fg = palette.color4 })
        api.nvim_set_hl(0, "@type.qualifier", { fg = palette.color4 })
        api.nvim_set_hl(0, "@Constant", { fg = palette.color6 })
        api.nvim_set_hl(0, "@markup.strong.markdown_inline", { bold = true })

        api.nvim_set_hl(0, "WhichKeyFloat", { bg = palette.background })
        api.nvim_set_hl(0, "WhichKeyBorder", { bg = palette.background })

        api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = palette.color9 })
        api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = palette.color4 })
        api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = palette.color11 })
        api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = palette.color3 })
        api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = palette.color2 })
        api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = palette.color5 })
        api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = palette.color6 })

        api.nvim_set_hl(0, "NormalFloat", { bg = palette.background })
        api.nvim_set_hl(0, "TelescopeNormal", { bg = palette.background })
        api.nvim_set_hl(0, "TelescopeBorder", { bg = palette.background })
        api.nvim_set_hl(0, "FloatBorder", { bg = palette.background })
        api.nvim_set_hl(0, "PmenuSel", { bg = palette.pmenusel })

        api.nvim_set_hl(0, "CursorLineNr", { fg = palette.color7 })

        render_markdown_colors()
    end
}
