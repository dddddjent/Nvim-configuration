local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv

local palette = {
    red        = hsl('#e57474'), -- error, git removed, delimiter
    green      = hsl('#8ccf7e'), -- msg, git added, delimiter
    yellow     = hsl('#e5c76b'), -- warning, git changed, delimiter
    blue       = hsl('#67b0e8'), -- info, delimiter
    purple     = hsl('#c678dd'), -- delimiter
    white      = hsl('#dadada'),
    cyan       = hsl('#6cbfbf'), -- hint, git merged, delimiter

    -- color0     = hsl('#232a2d'),
    -- color1     = hsl('#e57474'),
    -- color2     = hsl('#8ccf7e'),
    color3     = hsl('#e5c76b'), -- IncSearch, Type
    color4     = hsl('#67b0e8'), -- Directory
    -- color5     = hsl('#c678dd'),
    color6     = hsl('#6cbfbf'), -- quickfix, constant, special, operator, delimiter, todo
    -- color7     = hsl('#bdc3c2'),
    -- color8     = hsl('#2d3437'),
    color9     = hsl('#ef7e7e'), -- function, nvimtree icon, markdown
    color10    = hsl('#96d988'), -- strings, markdown
    color11    = hsl('#f4d67a'), -- number, markdown
    color12    = hsl('#71baf2'), -- cursor, tablinesel, keyword, markdown
    color13    = hsl('#ce89df'), -- markdown
    -- color14    = hsl('#67cbe7'),
    color15    = hsl('#dadada'), -- cursorline nr, sagacount, title

    comment    = hsl('#505759'),
    contrast   = hsl('#0d1014'),
    background = hsl('#15191f'),
    foreground = hsl('#bdc3c2'),
    cursorline = hsl('#2c3333'),
    macro      = hsl('#A09A29'),
    pmenusel   = hsl('#304759'),
}

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
    local sym = injected_functions.sym
    return {
        ------------------------------------------
        -- UI
        Normal{ fg = palette.foreground, bg = palette.background, },
        NormalFloat{ Normal },
        StatusLine{ Normal },
        StatusLineNC{ Normal },

        Title{ Normal, fg = palette.color15, gui = "bold" },

        Directory{ fg = palette.color4 },
        qfFileName{ Directory },

        Visual{ bg = Normal.bg.lighten(20), },
        IncSearch{ fg = palette.color3, bg = Visual.bg, },
        Search{ IncSearch },

        Error{ fg = palette.red, },
        ErrorMsg{ Error },
        DiagnosticError{ Error },
        DiagnosticERRORReverse{ fg = Normal.bg, bg = Error.fg, },
        Warn{ fg = palette.yellow, },
        WarningMsg{ Warn },
        DiagnosticWarn{ WarningMsg },
        DiagnosticWARNReverse{ fg = Normal.bg, bg = Warn.fg, },
        Info{ fg = palette.blue, },
        DiagnosticInfo{ Info },
        DiagnosticINFOReverse{ fg = Normal.bg, bg = Info.fg, },
        Hint{ fg = palette.cyan, },
        DiagnosticHint{ Hint },
        DiagnosticHINTReverse{ fg = Normal.bg, bg = Hint.fg, },
        MoreMsg{ fg = palette.green, },
        ModeMsg{ fg = palette.green, },

        Added{ fg = palette.green, },
        Removed{ fg = palette.red, },
        Changed{ fg = palette.yellow, },
        DiffAdd{ Added, },
        DiffChange{ Changed, },
        DiffDelete{ Removed, },

        Pmenu{ bg = palette.contrast, },
        PmenuSbar{ bg = Visual.bg, },
        PmenuSel{ bg = palette.pmenusel, },
        PmenuThumb{ Normal },

        LineNr{ fg = palette.comment.lighten(20), },
        CursorLine{ bg = palette.cursorline, },
        CursorLineNr{ gui = "bold", fg = palette.color15, },
        Cursor{ fg = Normal.bg, bg = palette.color12, },
        TermCursor{ Cursor },
        CursorIM{ Cursor },
        FzfLuaCursor{ Cursor },
        HopCursor{ Cursor },

        TabLineSel{ fg = palette.color12, bg = palette.background, },
        QuickFixLine{ fg = palette.color6, },

        ------------------------------------------
        -- Languages
        Question{ Normal },
        Identifier{ Normal },
        Constant{ fg = palette.color6, },
        Boolean{ Constant },
        cConstant{ Constant },
        cppConstant{ Constant },
        cudaConstant{ Constant },
        sym"@constant"{ Constant },
        sym"@constant.builtin"{ Constant },
        sym"@lsp.type.enumMember"{ Constant, gui = "italic" },
        sym"@lsp.mod.readonly"{ Constant, gui = "bold" },
        sym"@lsp.typemod.vairable.readonly"{ Constant, gui = "bold" },
        Number{ fg = palette.color11, },
        Float{ Number },
        sym"@number"{ Number },
        sym"@float"{ Number },
        Keyword{ fg = palette.color12, },
        Statement{ Keyword },
        PreProc{ Keyword },
        sym"@type.qualifier"{ Keyword },
        sym"@type.builtin"{ Keyword },
        sym"@lsp.type.builtin"{ fg = palette.color12, },
        Type{ fg = palette.color3, },
        Typedef{ Type },
        cType{ Type },
        cppType{ Type },
        cudaType{ Type },
        sym"@type"{ Type },
        sym"@type.definition"{ Type },
        sym"@constructor"{ Type },
        sym"@lsp.type"{ Type },
        sym"@lsp.type.typeParameter"{ Type },
        Special{ fg = palette.color6, },
        sym"@variable.builtin"{ Special },
        sym"@variable.parameter.builtin"{ Special },
        sym"@variable.cmake"{ Special },
        sym"@module.builtin"{ Special },
        sym"@attribute.builtin"{ Special },
        sym"@function.builtin"{ Special },
        sym"@tag.builtin"{ Special },
        sym"@punctuation.special"{ Special },
        sym"@markup"{ Special },
        sym"@lsp.typemod.function.defaultLibrary"{ Special },
        Comment{ fg = palette.comment, },
        sym"@comment"{ Comment },
        sym"@text.literal"{ Comment },
        String{ fg = palette.color10, },
        Character{ String },
        cString{ String },
        cppRawString{ String },
        cppString{ String },
        sym"@string"{ String },
        sym"@character"{ String },
        Function{ fg = palette.color9, },
        cFunction{ Function },
        cFunctionPointer{ Function },
        sym"@function"{ Function },
        sym"@lsp.typemod.function.defaultLibrary.cpp"{ Function },
        Operator{ fg = palette.color6, },
        sym"@operator"{ Operator },
        Delimiter{ Operator },
        Todo{ gui = "bold", fg = Special.fg, },
        sym"@comment.todo"{ Todo },
        sym"@text.todo"{ Todo },
        sym"@lsp.type.macro"{ fg = palette.macro, },
        sym"@namespace"{ fg = palette.color9, },
        sym"@property"{ gui = "bold", fg = Normal.fg.lighten(16).saturate(20), },
        sym"@variable"{ Normal },
        sym"@variable.go"{ Normal },

        ------------------------------------------
        -- Plugins
        NvimTreeGitStaged{ Changed },
        NvimTreeGitRenamed{ Changed, },
        NvimTreeGitMerge{ fg = palette.cyan },
        NvimTreeFolderIcon{ fg = palette.color9, },
        NvimTreeGitDirty{ fg = palette.color9, },
        NvimTreeGitDeleted{ Removed, },
        NvimTreeGitNew{ Added, },
        NvimTreeSymlinkFolderName{ Directory },
        NvimTreeFolderName{ Directory },
        NvimTreeEmptyFolderName{ Directory },
        NvimTreeOpenedFolderName{ Directory },


        LspCodeLens{ gui = "italic", fg = palette.comment.darken(20), },
        LspCodeLensSeparator{ fg = LspCodeLens.fg, },
        LspCodeLensText{ fg = Comment.fg.lighten(30), },

        RenderMarkdownH1{ fg = palette.color9, bg = Normal.bg, },
        RenderMarkdownH1Bg{ fg = Normal.bg, bg = RenderMarkdownH1.fg, },
        RenderMarkdownH2{ fg = palette.color13, bg = Normal.bg, },
        RenderMarkdownH2Bg{ fg = Normal.bg, bg = RenderMarkdownH2.fg, },
        RenderMarkdownH3{ fg = Normal.bg, bg = palette.color12, },
        RenderMarkdownH3Bg{ fg = RenderMarkdownH3.bg, bg = Normal.bg, },
        RenderMarkdownH4{ fg = Normal.bg, bg = palette.color6, },
        RenderMarkdownH4Bg{ fg = RenderMarkdownH4.bg, bg = Normal.bg, },
        RenderMarkdownH5Bg{ fg = palette.color10 },
        RenderMarkdownH6Bg{ fg = palette.color9 },
        RenderMarkdownCodeInline{ bg = palette.contrast, },
        RenderMarkdownCode{ bg = palette.contrast, },
        RenderMarkdownCodeQuote{ bg = palette.contrast, },
        sym"@markup.strong.markdown_inline"{ gui = "bold", fg = palette.color11, },
        --
        RainbowDelimiterCyan{ fg = palette.cyan, },
        RainbowDelimiterViolet{ fg = palette.purple, },
        RainbowDelimiterGreen{ fg = palette.green, },
        RainbowDelimiterOrange{ fg = palette.yellow, },
        RainbowDelimiterYellow{ fg = palette.yellow, },
        RainbowDelimiterRed{ fg = palette.red, },
        RainbowDelimiterBlue{ fg = palette.blue, },

        TelescopeNormal{ bg = Normal.bg.darken(10), },
        TelescopeBorder{ bg = TelescopeNormal.bg, },
        TelescopeSelection{ bg = TelescopeNormal.bg, },
        TelescopeSelectionCaret{ fg = palette.red },
        TelescopePromptPrefix{ fg = palette.blue },
        FzfLuaNormal{ bg = TelescopeNormal.bg, },
        FzfLuaBorder{ bg = TelescopeNormal.bg, },

        WhichKey{ Function },
        SagaCount{ gui = "bold", fg = palette.color15, bg = Normal.bg, },

    }
end)
return theme
