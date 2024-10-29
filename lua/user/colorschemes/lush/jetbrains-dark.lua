local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv

local palette = {
    red        = hsl('#F75464').darken(0),              -- error, git removed, delimiter
    green      = hsl('#73AD2B').darken(0),              -- msg, git added, delimiter
    yellow     = hsl('#F2C55C').darken(0),              -- warning, git changed, delimiter
    blue       = hsl('#548AF7').darken(0),              -- info, delimiter
    purple     = hsl('#B189F5').darken(0),              -- delimiter
    white      = hsl('#BCBEC4').lighten(20),
    cyan       = hsl('#548AF7').rotate(10).lighten(20), -- hint, git merged, delimiter

    color10    = hsl('#6AAB73'),                        -- strings, markdown
    color11    = hsl('#2AACB8'),                        -- number, markdown
    color9     = hsl('#56A8F5'),                        -- function, nvimtree icon, markdown
    color4     = hsl('#67b0e8'),                        -- Directory
    color3     = hsl('#9192BA'),                        -- IncSearch, Type
    color8     = hsl('#9192BA'),                        -- namespace
    color6     = hsl('#C77DBB'),                        -- quickfix, constant, special, delimiter, todo
    color13    = hsl('#ce89df'),                        -- markdown
    color12    = hsl('#CF8E6D'),                        -- cursor, tablinesel, keyword, markdown
    color14    = hsl('#B3AE60'),                        -- metadata
    color7     = hsl('#BCBEC4').lighten(20),            -- operator
    color15    = hsl('#dadada'),                        -- cursorline nr, sagacount, title

    comment    = hsl('#5F826B').darken(35),
    contrast   = hsl('#0d1014'),
    background = hsl('#BCBEC4').darken(85),
    foreground = hsl('#BCBEC4').lighten(20), -- line number
    cursorline = hsl('#2c3333'),
    macro      = hsl('#908B25'),
    pmenusel   = hsl('#304759'),
    property   = hsl('#9373A5').lighten(5),
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

        LineNr{ fg = Normal.fg.darken(45), },
        CursorLine{ bg = palette.cursorline, },
        CursorLineNr{ gui = "bold", fg = palette.color7, },
        Cursor{ fg = Normal.bg, bg = palette.color12, },
        TermCursor{ Cursor },
        CursorIM{ Cursor },
        FzfLuaCursor{ Cursor },
        HopCursor{ Cursor },

        TabLineSel{ fg = palette.color12, bg = palette.background, },
        QuickFixLine{ fg = palette.cyan, },

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
        sym"@keyword.directive"{ fg = palette.color14, },
        sym"@keyword.import"{ fg = palette.color14, },
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
        Operator{ fg = palette.color7, },
        sym"@operator"{ Operator },
        Delimiter{ Operator },
        Todo{ gui = "bold", fg = Special.fg, },
        sym"@comment.todo"{ Todo },
        sym"@text.todo"{ Todo },
        sym"@lsp.type.macro"{ fg = palette.macro, },
        sym"@namespace"{ fg = palette.color8, },
        sym"@property"{ gui = "bold", fg = palette.property, },
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
        RainbowDelimiterCyan{ fg = palette.cyan.desaturate(30), },
        RainbowDelimiterViolet{ fg = palette.purple.desaturate(30), },
        RainbowDelimiterGreen{ fg = palette.green.desaturate(30), },
        RainbowDelimiterOrange{ fg = palette.yellow.desaturate(30), },
        RainbowDelimiterYellow{ fg = palette.yellow.desaturate(30), },
        RainbowDelimiterRed{ fg = palette.red.desaturate(30), },
        RainbowDelimiterBlue{ fg = palette.blue.desaturate(30), },

        TelescopeNormal{ bg = Normal.bg, },
        TelescopeBorder{ bg = Normal.bg, },
        FzfLuaNormal{ Normal },
        FzfLuaBorder{ Normal },
        FzfLuaDirIcon{ Directory },
        FzfLuaSearch{ IncSearch },

        WhichKey{ Function },
        SagaCount{ gui = "bold", fg = palette.color7, bg = Normal.bg, },

    }
end)
return theme
