local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv
local theme = lush(function(injected_functions)
    local sym = injected_functions.sym
    return {
        SpecialKey{ fg = "nvimdarkgrey4", },                                                                         -- SpecialKey     xxx guifg=NvimDarkGrey4
        TermCursor{ gui = "reverse", },                                                                              -- TermCursor     xxx cterm=reverse gui=reverse
        GitSignsAddInline{ TermCursor },                                                                             -- GitSignsAddInline xxx links to TermCursor
        GitSignsDeleteInline{ TermCursor },                                                                          -- GitSignsDeleteInline xxx links to TermCursor
        GitSignsChangeInline{ TermCursor },                                                                          -- GitSignsChangeInline xxx links to TermCursor
        NonText{ fg = "nvimdarkgrey4", },                                                                            -- NonText        xxx guifg=NvimDarkGrey4
        EndOfBuffer{ NonText },                                                                                      -- EndOfBuffer    xxx links to NonText
        Whitespace{ NonText },                                                                                       -- Whitespace     xxx links to NonText
        LspInlayHint{ NonText },                                                                                     -- LspInlayHint   xxx links to NonText
        FidgetTask{ NonText },                                                                                       -- FidgetTask     xxx links to NonText
        GitSignsCurrentLineBlame{ NonText },                                                                         -- GitSignsCurrentLineBlame xxx links to NonText
        FzfLuaFzfInfo{ NonText },                                                                                    -- FzfLuaFzfInfo  xxx links to NonText
        Directory{ fg = "#68b1e8", },                                                                                -- Directory      xxx guifg=#68b1e8
        qfFileName{ Directory },                                                                                     -- qfFileName     xxx links to Directory
        NvimTreeSymlinkFolderName{ Directory },                                                                      -- NvimTreeSymlinkFolderName xxx links to Directory
        FzfLuaDirIcon{ Directory },                                                                                  -- FzfLuaDirIcon  xxx links to Directory
        NvimTreeFolderName{ Directory },                                                                             -- NvimTreeFolderName xxx links to Directory
        NvimTreeEmptyFolderName{ Directory },                                                                        -- NvimTreeEmptyFolderName xxx links to Directory
        NvimTreeOpenedFolderName{ Directory },                                                                       -- NvimTreeOpenedFolderName xxx links to Directory
        ErrorMsg{ fg = "#e57676", },                                                                                 -- ErrorMsg       xxx guifg=#e57676
        NvimInvalidSpacing{ ErrorMsg },                                                                              -- NvimInvalidSpacing xxx links to ErrorMsg
        IncSearch{ fg = "#e5c76c", bg = "#494f50", },                                                                -- IncSearch      xxx guifg=#e5c76c guibg=#494f50
        FzfLuaSearch{ IncSearch },                                                                                   -- FzfLuaSearch   xxx links to IncSearch
        HopPreview{ IncSearch },                                                                                     -- HopPreview     xxx links to IncSearch
        Search{ fg = "#e5c76c", bg = "#494f50", },                                                                   -- Search         xxx guifg=#e5c76c guibg=#494f50
        Substitute{ Search },                                                                                        -- Substitute     xxx links to Search
        RenameMatch{ Search },                                                                                       -- RenameMatch    xxx links to Search
        SagaSearch{ Search },                                                                                        -- SagaSearch     xxx links to Search
        CurSearch{ fg = "nvimdarkgrey1", bg = "nvimlightyellow", },                                                  -- CurSearch      xxx ctermfg=0 ctermbg=11 guifg=NvimDarkGrey1 guibg=NvimLightYellow
        MoreMsg{ fg = "#95d987", },                                                                                  -- MoreMsg        xxx guifg=#95d987
        ModeMsg{ fg = "#95d987", },                                                                                  -- ModeMsg        xxx guifg=#95d987
        NvimTreeLiveFilterValue{ ModeMsg },                                                                          -- NvimTreeLiveFilterValue xxx links to ModeMsg
        LineNr{ fg = "#5c6466", },                                                                                   -- LineNr         xxx guifg=#5c6466
        LineNrAbove{ LineNr },                                                                                       -- LineNrAbove    xxx links to LineNr
        LineNrBelow{ LineNr },                                                                                       -- LineNrBelow    xxx links to LineNr
        RenderMarkdownDash{ LineNr },                                                                                -- RenderMarkdownDash xxx links to LineNr
        NvimTreeLineNr{ LineNr },                                                                                    -- NvimTreeLineNr xxx links to LineNr
        CursorLineNr{ gui = "bold", fg = "#d9d9d9", },                                                               -- CursorLineNr   xxx cterm=bold gui=bold guifg=#d9d9d9
        FzfLuaCursorLineNr{ CursorLineNr },                                                                          -- FzfLuaCursorLineNr xxx links to CursorLineNr
        NvimTreeCursorLineNr{ CursorLineNr },                                                                        -- NvimTreeCursorLineNr xxx links to CursorLineNr
        Title{ gui = "bold", fg = "nvimlightgrey2", },                                                               -- Title          xxx cterm=bold gui=bold guifg=NvimLightGrey2
        FloatTitle{ Title },                                                                                         -- FloatTitle     xxx links to Title
        sym"@markup.heading"{ Title },                                                                               -- @markup.heading xxx links to Title
        ActionPreviewTitle{ Title },                                                                                 -- ActionPreviewTitle xxx links to Title
        SagaTitle{ Title },                                                                                          -- SagaTitle      xxx links to Title
        SagaFolder{ Title },                                                                                         -- SagaFolder     xxx links to Title
        NullLsInfoSources{ Title },                                                                                  -- NullLsInfoSources xxx links to Title
        FidgetTitle{ Title },                                                                                        -- FidgetTitle    xxx links to Title
        NvimTreeSpecialFile{ Title },                                                                                -- NvimTreeSpecialFile xxx links to Title
        NvimTreeRootFolder{ Title },                                                                                 -- NvimTreeRootFolder xxx links to Title
        Visual{ bg = "#3a4555", },                                                                                   -- Visual         xxx guibg=#3a4555
        VisualNOS{ Visual },                                                                                         -- VisualNOS      xxx links to Visual
        LspReferenceText{ Visual },                                                                                  -- LspReferenceText xxx links to Visual
        LspSignatureActiveParameter{ Visual },                                                                       -- LspSignatureActiveParameter xxx links to Visual
        SnippetTabstop{ Visual },                                                                                    -- SnippetTabstop xxx links to Visual
        UfoFoldedBg{ Visual },                                                                                       -- UfoFoldedBg    xxx links to Visual
        UfoPreviewCursorLine{ Visual },                                                                              -- UfoPreviewCursorLine xxx links to Visual
        TSPlaygroundFocus{ Visual },                                                                                 -- TSPlaygroundFocus xxx links to Visual
        WarningMsg{ fg = "#e5c76c", },                                                                               -- WarningMsg     xxx guifg=#e5c76c
        DiagnosticWarn{ WarningMsg },                                                                                -- DiagnosticWarn xxx links to WarningMsg
        Folded{ fg = "nvimlightgrey4", bg = "nvimdarkgrey3", },                                                      -- Folded         xxx guifg=NvimLightGrey4 guibg=NvimDarkGrey3
        DiffAdd{ fg = "#8acf7d", },                                                                                  -- DiffAdd        xxx guifg=#8acf7d
        CodeActionNumber{ DiffAdd },                                                                                 -- CodeActionNumber xxx links to DiffAdd
        GitSignsAddLn{ DiffAdd },                                                                                    -- GitSignsAddLn  xxx links to DiffAdd
        GitSignsAddPreview{ DiffAdd },                                                                               -- GitSignsAddPreview xxx links to DiffAdd
        DiffChange{ fg = "#f4d67b", },                                                                               -- DiffChange     xxx guifg=#f4d67b
        GitSignsChangeLn{ DiffChange },                                                                              -- GitSignsChangeLn xxx links to DiffChange
        DiffDelete{ fg = "#ef8080", },                                                                               -- DiffDelete     xxx guifg=#ef8080
        RenderMarkdownH5Bg{ DiffDelete },                                                                            -- RenderMarkdownH5Bg xxx links to DiffDelete
        RenderMarkdownH6Bg{ DiffDelete },                                                                            -- RenderMarkdownH6Bg xxx links to DiffDelete
        GitSignsDeletePreview{ DiffDelete },                                                                         -- GitSignsDeletePreview xxx links to DiffDelete
        GitSignsDeleteVirtLn{ DiffDelete },                                                                          -- GitSignsDeleteVirtLn xxx links to DiffDelete
        DiffText{ fg = "nvimlightgrey1", bg = "nvimdarkcyan", },                                                     -- DiffText       xxx ctermfg=0 ctermbg=14 guifg=NvimLightGrey1 guibg=NvimDarkCyan
        SignColumn{ fg = "nvimdarkgrey4", },                                                                         -- SignColumn     xxx guifg=NvimDarkGrey4
        CursorLineSign{ SignColumn },                                                                                -- CursorLineSign xxx links to SignColumn
        FoldColumn{ SignColumn },                                                                                    -- FoldColumn     xxx links to SignColumn
        RenderMarkdownSign{ SignColumn },                                                                            -- RenderMarkdownSign xxx links to SignColumn
        Conceal{ fg = "nvimdarkgrey4", },                                                                            -- Conceal        xxx guifg=NvimDarkGrey4
        RenderMarkdownTableFill{ Conceal },                                                                          -- RenderMarkdownTableFill xxx links to Conceal
        NvimTreeHiddenIcon{ Conceal },                                                                               -- NvimTreeHiddenIcon xxx links to Conceal
        NvimTreeHiddenDisplay{ Conceal },                                                                            -- NvimTreeHiddenDisplay xxx links to Conceal
        SpellBad{ sp = "nvimlightred", gui = "undercurl", },                                                         -- SpellBad       xxx cterm=undercurl gui=undercurl guisp=NvimLightRed
        NvimTreeCutHL{ SpellBad },                                                                                   -- NvimTreeCutHL  xxx links to SpellBad
        SpellCap{ sp = "nvimlightyellow", gui = "undercurl", },                                                      -- SpellCap       xxx cterm=undercurl gui=undercurl guisp=NvimLightYellow
        SpellRare{ sp = "nvimlightcyan", gui = "undercurl", },                                                       -- SpellRare      xxx cterm=undercurl gui=undercurl guisp=NvimLightCyan
        NvimTreeCopiedHL{ SpellRare },                                                                               -- NvimTreeCopiedHL xxx links to SpellRare
        SpellLocal{ sp = "nvimlightgreen", gui = "undercurl", },                                                     -- SpellLocal     xxx cterm=undercurl gui=undercurl guisp=NvimLightGreen
        NvimTreeBookmarkHL{ SpellLocal },                                                                            -- NvimTreeBookmarkHL xxx links to SpellLocal
        Pmenu{ bg = "#111418", },                                                                                    -- Pmenu          xxx guibg=#111418
        PmenuKind{ Pmenu },                                                                                          -- PmenuKind      xxx links to Pmenu
        PmenuExtra{ Pmenu },                                                                                         -- PmenuExtra     xxx links to Pmenu
        PmenuSbar{ Pmenu },                                                                                          -- PmenuSbar      xxx links to Pmenu
        PmenuSel{ bg = "#30485a", },                                                                                 -- PmenuSel       xxx guibg=#30485a
        WildMenu{ PmenuSel },                                                                                        -- WildMenu       xxx links to PmenuSel
        PmenuKindSel{ PmenuSel },                                                                                    -- PmenuKindSel   xxx links to PmenuSel
        PmenuExtraSel{ PmenuSel },                                                                                   -- PmenuExtraSel  xxx links to PmenuSel
        TabLine{ bg = "#0c0f13", },                                                                                  -- TabLine        xxx guibg=#0c0f13
        TabLineFill{ TabLine },                                                                                      -- TabLineFill    xxx links to TabLine
        TabLineSel{ fg = "#73bbf2", bg = "#15191e", },                                                               -- TabLineSel     xxx guifg=#73bbf2 guibg=#15191e
        CursorColumn{ bg = "nvimdarkgrey3", },                                                                       -- CursorColumn   xxx guibg=NvimDarkGrey3
        NvimTreeCursorColumn{ CursorColumn },                                                                        -- NvimTreeCursorColumn xxx links to CursorColumn
        CursorLine{ bg = "#15191e", },                                                                               -- CursorLine     xxx guibg=#15191e
        UfoCursorFoldedLine{ CursorLine },                                                                           -- UfoCursorFoldedLine xxx links to CursorLine
        CodeActionCursorLine{ CursorLine },                                                                          -- CodeActionCursorLine xxx links to CursorLine
        FzfLuaCursorLine{ CursorLine },                                                                              -- FzfLuaCursorLine xxx links to CursorLine
        NvimTreeCursorLine{ CursorLine },                                                                            -- NvimTreeCursorLine xxx links to CursorLine
        ColorColumn{ bg = "nvimdarkgrey4", },                                                                        -- ColorColumn    xxx cterm=reverse guibg=NvimDarkGrey4
        QuickFixLine{ fg = "nvimlightcyan", },                                                                       -- QuickFixLine   xxx ctermfg=14 guifg=NvimLightCyan
        FloatBorder{ bg = "#15191e", },                                                                              -- FloatBorder    xxx guibg=#15191e
        SagaBorder{ FloatBorder },                                                                                   -- SagaBorder     xxx links to FloatBorder
        WhichKeyBorder{ FloatBorder },                                                                               -- WhichKeyBorder xxx links to FloatBorder
        NvimTreeNormalFloatBorder{ FloatBorder },                                                                    -- NvimTreeNormalFloatBorder xxx links to FloatBorder
        WinBar{ gui = "bold", fg = "nvimlightgrey4", bg = "nvimdarkgrey1", },                                        -- WinBar         xxx cterm=bold gui=bold guifg=NvimLightGrey4 guibg=NvimDarkGrey1
        WinBarNC{ fg = "nvimlightgrey4", bg = "nvimdarkgrey1", },                                                    -- WinBarNC       xxx cterm=bold guifg=NvimLightGrey4 guibg=NvimDarkGrey1
        Cursor{ fg = "#15191e", bg = "#68b1e8", },                                                                   -- Cursor         xxx guifg=#15191e guibg=#68b1e8
        CursorIM{ Cursor },                                                                                          -- CursorIM       xxx links to Cursor
        FzfLuaCursor{ Cursor },                                                                                      -- FzfLuaCursor   xxx links to Cursor
        HopCursor{ Cursor },                                                                                         -- HopCursor      xxx links to Cursor
        RedrawDebugNormal{ gui = "reverse", },                                                                       -- RedrawDebugNormal xxx cterm=reverse gui=reverse
        Underlined{ gui = "underline", },                                                                            -- Underlined     xxx cterm=underline gui=underline
        sym"@string.special.url"{ Underlined },                                                                      -- @string.special.url xxx links to Underlined
        sym"@markup.link"{ Underlined },                                                                             -- @markup.link   xxx links to Underlined
        NvimTreeSymlink{ Underlined },                                                                               -- NvimTreeSymlink xxx links to Underlined
        lCursor{ fg = "bg", bg = "fg", },                                                                            -- lCursor        xxx guifg=bg guibg=fg
        Normal{ fg = "#bcc2c1", bg = "#15191e", },                                                                   -- Normal         xxx guifg=#bcc2c1 guibg=#15191e
        Question{ Normal },                                                                                          -- Question       xxx links to Normal
        StatusLine{ Normal },                                                                                        -- StatusLine     xxx links to Normal
        StatusLineNC{ Normal },                                                                                      -- StatusLineNC   xxx links to Normal
        WinSeparator{ Normal },                                                                                      -- WinSeparator   xxx links to Normal
        PmenuThumb{ Normal },                                                                                        -- PmenuThumb     xxx links to Normal
        NormalFloat{ Normal },                                                                                       -- NormalFloat    xxx links to Normal
        Ignore{ Normal },                                                                                            -- Ignore         xxx links to Normal
        sym"@variable"{ Normal },                                                                                    -- @variable      xxx links to Normal
        Identifier{ Normal },                                                                                        -- Identifier     xxx links to Normal
        NvimSpacing{ Normal },                                                                                       -- NvimSpacing    xxx links to Normal
        RenderMarkdownTableRow{ Normal },                                                                            -- RenderMarkdownTableRow xxx links to Normal
        RenderMarkdownBullet{ Normal },                                                                              -- RenderMarkdownBullet xxx links to Normal
        sym"@variable.go"{ Normal },                                                                                 -- @variable.go   xxx links to Normal
        DapUINormal{ Normal },                                                                                       -- DapUINormal    xxx links to Normal
        DapUIVariable{ Normal },                                                                                     -- DapUIVariable  xxx links to Normal
        DapUIValue{ Normal },                                                                                        -- DapUIValue     xxx links to Normal
        DapUIFrameName{ Normal },                                                                                    -- DapUIFrameName xxx links to Normal
        FzfLuaNormal{ Normal },                                                                                      -- FzfLuaNormal   xxx links to Normal
        FzfLuaBorder{ Normal },                                                                                      -- FzfLuaBorder   xxx links to Normal
        NvimTreeNormal{ Normal },                                                                                    -- NvimTreeNormal xxx links to Normal
        NvimTreePopup{ Normal },                                                                                     -- NvimTreePopup  xxx links to Normal
        NeotestTest{ Normal },                                                                                       -- NeotestTest    xxx links to Normal
        NeotestUnknown{ Normal },                                                                                    -- NeotestUnknown xxx links to Normal
        Constant{ fg = "#6ebfbf", },                                                                                 -- Constant       xxx guifg=#6ebfbf
        Boolean{ Constant },                                                                                         -- Boolean        xxx links to Constant
        SagaConstant{ Constant },                                                                                    -- SagaConstant   xxx links to Constant
        SagaKey{ Constant },                                                                                         -- SagaKey        xxx links to Constant
        SagaNull{ Constant },                                                                                        -- SagaNull       xxx links to Constant
        SagaEvent{ Constant },                                                                                       -- SagaEvent      xxx links to Constant
        cConstant{ Constant },                                                                                       -- cConstant      xxx links to Constant
        cppConstant{ Constant },                                                                                     -- cppConstant    xxx links to Constant
        cudaConstant{ Constant },                                                                                    -- cudaConstant   xxx links to Constant
        Number{ fg = "#e5c76c", },                                                                                   -- Number         xxx guifg=#e5c76c
        Float{ Number },                                                                                             -- Float          xxx links to Number
        sym"@number"{ Number },                                                                                      -- @number        xxx links to Number
        NvimNumber{ Number },                                                                                        -- NvimNumber     xxx links to Number
        sym"@float"{ Number },                                                                                       -- @float         xxx links to Number
        SagaNumber{ Number },                                                                                        -- SagaNumber     xxx links to Number
        SagaEnumMember{ Number },                                                                                    -- SagaEnumMember xxx links to Number
        SagaUnit{ Number },                                                                                          -- SagaUnit       xxx links to Number
        cNumber{ Number },                                                                                           -- cNumber        xxx links to Number
        cOctal{ Number },                                                                                            -- cOctal         xxx links to Number
        cppNumber{ Number },                                                                                         -- cppNumber      xxx links to Number
        cppFloat{ Number },                                                                                          -- cppFloat       xxx links to Number
        Keyword{ fg = "#68b1e8", },                                                                                  -- Keyword        xxx guifg=#68b1e8
        Conditional{ Keyword },                                                                                      -- Conditional    xxx links to Keyword
        Statement{ Keyword },                                                                                        -- Statement      xxx links to Keyword
        Repeat{ Keyword },                                                                                           -- Repeat         xxx links to Keyword
        Label{ Keyword },                                                                                            -- Label          xxx links to Keyword
        Exception{ Keyword },                                                                                        -- Exception      xxx links to Keyword
        PreProc{ Keyword },                                                                                          -- PreProc        xxx links to Keyword
        sym"@type.builtin"{ Keyword },                                                                               -- @type.builtin  xxx links to Keyword
        sym"@keyword"{ Keyword },                                                                                    -- @keyword       xxx links to Keyword
        sym"@type.qualifier"{ Keyword },                                                                             -- @type.qualifier xxx links to Keyword
        SagaInCurrent{ Keyword },                                                                                    -- SagaInCurrent  xxx links to Keyword
        WhichKeyGroup{ Keyword },                                                                                    -- WhichKeyGroup  xxx links to Keyword
        Type{ fg = "#e5c76c", },                                                                                     -- Type           xxx guifg=#e5c76c
        StorageClass{ Type },                                                                                        -- StorageClass   xxx links to Type
        Structure{ Type },                                                                                           -- Structure      xxx links to Type
        Typedef{ Type },                                                                                             -- Typedef        xxx links to Type
        sym"@type"{ Type },                                                                                          -- @type          xxx links to Type
        sym"@constructor"{ Type },                                                                                   -- @constructor   xxx links to Type
        sym"@lsp.type"{ Type },                                                                                      -- @lsp.type      xxx links to Type
        sym"@lsp.type.typeParameter"{ Type },                                                                        -- @lsp.type.typeParameter xxx links to Type
        sym"@type.definition"{ Type },                                                                               -- @type.definition xxx links to Type
        NvimNumberPrefix{ Type },                                                                                    -- NvimNumberPrefix xxx links to Type
        NvimOptionSigil{ Type },                                                                                     -- NvimOptionSigil xxx links to Type
        SagaInterface{ Type },                                                                                       -- SagaInterface  xxx links to Type
        SagaArray{ Type },                                                                                           -- SagaArray      xxx links to Type
        SagaObject{ Type },                                                                                          -- SagaObject     xxx links to Type
        SagaStruct{ Type },                                                                                          -- SagaStruct     xxx links to Type
        SagaTypeParameter{ Type },                                                                                   -- SagaTypeParameter xxx links to Type
        SagaTypeAlias{ Type },                                                                                       -- SagaTypeAlias  xxx links to Type
        NullLsInfoTitle{ Type },                                                                                     -- NullLsInfoTitle xxx links to Type
        cType{ Type },                                                                                               -- cType          xxx links to Type
        cppModifier{ Type },                                                                                         -- cppModifier    xxx links to Type
        cppType{ Type },                                                                                             -- cppType        xxx links to Type
        cudaType{ Type },                                                                                            -- cudaType       xxx links to Type
        NvimTreeModifiedIcon{ Type },                                                                                -- NvimTreeModifiedIcon xxx links to Type
        Special{ fg = "#6ebfbf", },                                                                                  -- Special        xxx guifg=#6ebfbf
        Tag{ Special },                                                                                              -- Tag            xxx links to Special
        SpecialChar{ Special },                                                                                      -- SpecialChar    xxx links to Special
        SpecialComment{ Special },                                                                                   -- SpecialComment xxx links to Special
        Debug{ Special },                                                                                            -- Debug          xxx links to Special
        sym"@variable.builtin"{ Special },                                                                           -- @variable.builtin xxx links to Special
        sym"@variable.parameter.builtin"{ Special },                                                                 -- @variable.parameter.builtin xxx links to Special
        sym"@constant"{ Special },                                                                                   -- @constant      xxx links to Special
        sym"@constant.builtin"{ Special },                                                                           -- @constant.builtin xxx links to Special
        sym"@module.builtin"{ Special },                                                                             -- @module.builtin xxx links to Special
        sym"@attribute.builtin"{ Special },                                                                          -- @attribute.builtin xxx links to Special
        sym"@function.builtin"{ Special },                                                                           -- @function.builtin xxx links to Special
        sym"@punctuation.special"{ Special },                                                                        -- @punctuation.special xxx links to Special
        sym"@markup"{ Special },                                                                                     -- @markup        xxx links to Special
        sym"@tag.builtin"{ Special },                                                                                -- @tag.builtin   xxx links to Special
        sym"@lsp.typemod.function.defaultLibrary"{ Special },                                                        -- @lsp.typemod.function.defaultLibrary xxx links to Special
        sym"@variable.cmake"{ Special },                                                                             -- @variable.cmake xxx links to Special
        FzfLuaFzfMatch{ Special },                                                                                   -- FzfLuaFzfMatch xxx links to Special
        FzfLuaFzfPointer{ Special },                                                                                 -- FzfLuaFzfPointer xxx links to Special
        FzfLuaFzfPrompt{ Special },                                                                                  -- FzfLuaFzfPrompt xxx links to Special
        NvimTreeOpenedHL{ Special },                                                                                 -- NvimTreeOpenedHL xxx links to Special
        LspCodeLens{ gui = "italic", fg = "#2e3538", },                                                              -- LspCodeLens    xxx cterm=italic gui=italic guifg=#2e3538
        LspCodeLensSeparator{ fg = "#2e3538", },                                                                     -- LspCodeLensSeparator xxx guifg=#2e3538
        DiagnosticInfo{ fg = "#68b1e8", },                                                                           -- DiagnosticInfo xxx guifg=#68b1e8
        DiagnosticFloatingInfo{ DiagnosticInfo },                                                                    -- DiagnosticFloatingInfo xxx links to DiagnosticInfo
        DiagnosticVirtualTextInfo{ DiagnosticInfo },                                                                 -- DiagnosticVirtualTextInfo xxx links to DiagnosticInfo
        DiagnosticSignInfo{ DiagnosticInfo },                                                                        -- DiagnosticSignInfo xxx links to DiagnosticInfo
        sym"@comment.note"{ DiagnosticInfo },                                                                        -- @comment.note  xxx links to DiagnosticInfo
        DiagnosticUnderlineInfo{ DiagnosticInfo },                                                                   -- DiagnosticUnderlineInfo xxx links to DiagnosticInfo
        RenderMarkdownInfo{ DiagnosticInfo },                                                                        -- RenderMarkdownInfo xxx links to DiagnosticInfo
        NvimTreeDiagnosticInfoIcon{ DiagnosticInfo },                                                                -- NvimTreeDiagnosticInfoIcon xxx links to DiagnosticInfo
        DiagnosticHint{ fg = "#6ebfbf", },                                                                           -- DiagnosticHint xxx guifg=#6ebfbf
        DiagnosticFloatingHint{ DiagnosticHint },                                                                    -- DiagnosticFloatingHint xxx links to DiagnosticHint
        DiagnosticVirtualTextHint{ DiagnosticHint },                                                                 -- DiagnosticVirtualTextHint xxx links to DiagnosticHint
        DiagnosticSignHint{ DiagnosticHint },                                                                        -- DiagnosticSignHint xxx links to DiagnosticHint
        DiagnosticUnderlineHint{ DiagnosticHint },                                                                   -- DiagnosticUnderlineHint xxx links to DiagnosticHint
        RenderMarkdownHint{ DiagnosticHint },                                                                        -- RenderMarkdownHint xxx links to DiagnosticHint
        NvimTreeDiagnosticHintIcon{ DiagnosticHint },                                                                -- NvimTreeDiagnosticHintIcon xxx links to DiagnosticHint
        DiagnosticOk{ fg = "#8acf7d", },                                                                             -- DiagnosticOk   xxx guifg=#8acf7d
        DiagnosticFloatingOk{ DiagnosticOk },                                                                        -- DiagnosticFloatingOk xxx links to DiagnosticOk
        DiagnosticVirtualTextOk{ DiagnosticOk },                                                                     -- DiagnosticVirtualTextOk xxx links to DiagnosticOk
        DiagnosticSignOk{ DiagnosticOk },                                                                            -- DiagnosticSignOk xxx links to DiagnosticOk
        DiagnosticUnderlineOk{ DiagnosticOk },                                                                       -- DiagnosticUnderlineOk xxx links to DiagnosticOk
        RenderMarkdownSuccess{ DiagnosticOk },                                                                       -- RenderMarkdownSuccess xxx links to DiagnosticOk
        Comment{ fg = "#5c6466", },                                                                                  -- Comment        xxx guifg=#5c6466
        DiagnosticUnnecessary{ Comment },                                                                            -- DiagnosticUnnecessary xxx links to Comment
        sym"@comment"{ Comment },                                                                                    -- @comment       xxx links to Comment
        UfoFoldedEllipsis{ Comment },                                                                                -- UfoFoldedEllipsis xxx links to Comment
        sym"@text.literal"{ Comment },                                                                               -- @text.literal  xxx links to Comment
        SagaSep{ Comment },                                                                                          -- SagaSep        xxx links to Comment
        SagaDetail{ Comment },                                                                                       -- SagaDetail     xxx links to Comment
        SagaText{ Comment },                                                                                         -- SagaText       xxx links to Comment
        SagaToggle{ Comment },                                                                                       -- SagaToggle     xxx links to Comment
        SagaFolderName{ Comment },                                                                                   -- SagaFolderName xxx links to Comment
        SagaFileName{ Comment },                                                                                     -- SagaFileName   xxx links to Comment
        NvimDapVirtualText{ Comment },                                                                               -- NvimDapVirtualText xxx links to Comment
        WhichKeySeparator{ Comment },                                                                                -- WhichKeySeparator xxx links to Comment
        WhichKeyValue{ Comment },                                                                                    -- WhichKeyValue  xxx links to Comment
        cComment{ Comment },                                                                                         -- cComment       xxx links to Comment
        cCppOut{ Comment },                                                                                          -- cCppOut        xxx links to Comment
        FzfLuaDirPart{ Comment },                                                                                    -- FzfLuaDirPart  xxx links to Comment
        NvimTreeGitIgnoredIcon{ Comment },                                                                           -- NvimTreeGitIgnoredIcon xxx links to Comment
        String{ fg = "#8acf7d", },                                                                                   -- String         xxx guifg=#8acf7d
        Character{ String },                                                                                         -- Character      xxx links to String
        sym"@string"{ String },                                                                                      -- @string        xxx links to String
        sym"@character"{ String },                                                                                   -- @character     xxx links to String
        NvimString{ String },                                                                                        -- NvimString     xxx links to String
        TSPlaygroundLang{ String },                                                                                  -- TSPlaygroundLang xxx links to String
        SagaSelect{ String },                                                                                        -- SagaSelect     xxx links to String
        SagaString{ String },                                                                                        -- SagaString     xxx links to String
        cString{ String },                                                                                           -- cString        xxx links to String
        cppRawString{ String },                                                                                      -- cppRawString   xxx links to String
        cppString{ String },                                                                                         -- cppString      xxx links to String
        sym"@property"{ gui = "bold", fg = "#cce0dd", },                                                             -- @property      xxx cterm=bold gui=bold guifg=#cce0dd
        sym"@lsp.type.property"{ sym"@property" },                                                                   -- @lsp.type.property xxx links to @property
        DiagnosticShowBorder{ sym"@property" },                                                                      -- DiagnosticShowBorder xxx links to @property
        SagaProperty{ sym"@property" },                                                                              -- SagaProperty   xxx links to @property
        Function{ fg = "#ef8080", },                                                                                 -- Function       xxx guifg=#ef8080
        sym"@function"{ Function },                                                                                  -- @function      xxx links to Function
        sym"@lsp.typemod.function.defaultLibrary.cpp"{ Function },                                                   -- @lsp.typemod.function.defaultLibrary.cpp xxx links to Function
        SagaFinderFname{ Function },                                                                                 -- SagaFinderFname xxx links to Function
        SagaMethod{ Function },                                                                                      -- SagaMethod     xxx links to Function
        SagaFunction{ Function },                                                                                    -- SagaFunction   xxx links to Function
        SagaStaticMethod{ Function },                                                                                -- SagaStaticMethod xxx links to Function
        WhichKey{ Function },                                                                                        -- WhichKey       xxx links to Function
        cFunction{ Function },                                                                                       -- cFunction      xxx links to Function
        cFunctionPointer{ Function },                                                                                -- cFunctionPointer xxx links to Function
        Operator{ fg = "#6ebfbf", },                                                                                 -- Operator       xxx guifg=#6ebfbf
        sym"@operator"{ Operator },                                                                                  -- @operator      xxx links to Operator
        Delimiter{ Operator },                                                                                       -- Delimiter      xxx links to Operator
        NvimAssignment{ Operator },                                                                                  -- NvimAssignment xxx links to Operator
        NvimOperator{ Operator },                                                                                    -- NvimOperator   xxx links to Operator
        SagaWinbarSep{ Operator },                                                                                   -- SagaWinbarSep  xxx links to Operator
        SagaOperator{ Operator },                                                                                    -- SagaOperator   xxx links to Operator
        cOperator{ Operator },                                                                                       -- cOperator      xxx links to Operator
        cppOperator{ Operator },                                                                                     -- cppOperator    xxx links to Operator
        Todo{ gui = "bold", fg = "#6ebfbf", },                                                                       -- Todo           xxx cterm=bold gui=bold guifg=#6ebfbf
        sym"@comment.todo"{ Todo },                                                                                  -- @comment.todo  xxx links to Todo
        sym"@text.todo"{ Todo },                                                                                     -- @text.todo     xxx links to Todo
        cTodo{ Todo },                                                                                               -- cTodo          xxx links to Todo
        sym"@markup.strong"{ gui = "bold", },                                                                        -- @markup.strong xxx cterm=bold gui=bold
        sym"@markup.italic"{ gui = "italic", },                                                                      -- @markup.italic xxx cterm=italic gui=italic
        sym"@markup.strikethrough"{ gui = "strikethrough", },                                                        -- @markup.strikethrough xxx cterm=strikethrough gui=strikethrough
        sym"@markup.underline"{ gui = "underline", },                                                                -- @markup.underline xxx cterm=underline gui=underline
        Added{ fg = "nvimlightgreen", },                                                                             -- Added          xxx ctermfg=10 guifg=NvimLightGreen
        sym"@diff.plus"{ Added },                                                                                    -- @diff.plus     xxx links to Added
        GitSignsAdd{ Added },                                                                                        -- GitSignsAdd    xxx links to Added
        Removed{ fg = "nvimlightred", },                                                                             -- Removed        xxx ctermfg=9 guifg=NvimLightRed
        sym"@diff.minus"{ Removed },                                                                                 -- @diff.minus    xxx links to Removed
        GitSignsDelete{ Removed },                                                                                   -- GitSignsDelete xxx links to Removed
        Changed{ fg = "nvimlightcyan", },                                                                            -- Changed        xxx ctermfg=14 guifg=NvimLightCyan
        sym"@diff.delta"{ Changed },                                                                                 -- @diff.delta    xxx links to Changed
        GitSignsChange{ Changed },                                                                                   -- GitSignsChange xxx links to Changed
        sym"@lsp.type.macro"{ fg = "#9e9829", },                                                                     -- @lsp.type.macro xxx guifg=#9e9829
        DiagnosticDeprecated{ sp = "nvimlightred", gui = "strikethrough", },                                         -- DiagnosticDeprecated xxx cterm=strikethrough gui=strikethrough guisp=NvimLightRed
        sym"@lsp.mod.deprecated"{ DiagnosticDeprecated },                                                            -- @lsp.mod.deprecated xxx links to DiagnosticDeprecated
        FloatShadow{ bg = "nvimdarkgrey4", blend = 80, },                                                            -- FloatShadow    xxx ctermbg=0 guibg=NvimDarkGrey4 blend=80
        FloatShadowThrough{ bg = "nvimdarkgrey4", blend = 100, },                                                    -- FloatShadowThrough xxx ctermbg=0 guibg=NvimDarkGrey4 blend=100
        MatchParen{ gui = "bold", bg = "nvimdarkgrey4", },                                                           -- MatchParen     xxx cterm=bold,underline gui=bold guibg=NvimDarkGrey4
        RedrawDebugClear{ bg = "nvimdarkyellow", },                                                                  -- RedrawDebugClear xxx ctermfg=0 ctermbg=11 guibg=NvimDarkYellow
        RedrawDebugComposed{ bg = "nvimdarkgreen", },                                                                -- RedrawDebugComposed xxx ctermfg=0 ctermbg=10 guibg=NvimDarkGreen
        RedrawDebugRecompose{ bg = "nvimdarkred", },                                                                 -- RedrawDebugRecompose xxx ctermfg=0 ctermbg=9 guibg=NvimDarkRed
        Error{ fg = "#e57676", },                                                                                    -- Error          xxx guifg=#e57676
        DiagnosticError{ Error },                                                                                    -- DiagnosticError xxx links to Error
        NvimInvalid{ Error },                                                                                        -- NvimInvalid    xxx links to Error
        TSQueryLinterError{ Error },                                                                                 -- TSQueryLinterError xxx links to Error
        cBadContinuation{ Error },                                                                                   -- cBadContinuation xxx links to Error
        cError{ Error },                                                                                             -- cError         xxx links to Error
        NvimInternalError{ fg = "red", bg = "red", },                                                                -- NvimInternalError xxx ctermfg=9 ctermbg=9 guifg=Red guibg=Red
        NvimFigureBrace{ NvimInternalError },                                                                        -- NvimFigureBrace xxx links to NvimInternalError
        NvimSingleQuotedUnknownEscape{ NvimInternalError },                                                          -- NvimSingleQuotedUnknownEscape xxx links to NvimInternalError
        NvimInvalidSingleQuotedUnknownEscape{ NvimInternalError },                                                   -- NvimInvalidSingleQuotedUnknownEscape xxx links to NvimInternalError
        CmpItemAbbrDeprecatedDefault{ fg = "#5c6466", },                                                             -- CmpItemAbbrDeprecatedDefault xxx guifg=#5c6466
        CmpItemAbbrDeprecated{ CmpItemAbbrDeprecatedDefault },                                                       -- CmpItemAbbrDeprecated xxx links to CmpItemAbbrDeprecatedDefault
        CmpItemKindDefault{ fg = "#6ebfbf", },                                                                       -- CmpItemKindDefault xxx guifg=#6ebfbf
        CmpItemKind{ CmpItemKindDefault },                                                                           -- CmpItemKind    xxx links to CmpItemKindDefault
        RenderMarkdownH1Bg{ fg = "#15191e", bg = "#ef8080", },                                                       -- RenderMarkdownH1Bg xxx guifg=#15191e guibg=#ef8080
        RenderMarkdownCodeInline{ bg = "#0c0f13", },                                                                 -- RenderMarkdownCodeInline xxx guibg=#0c0f13
        RenderMarkdownCode{ bg = "#0c0f13", },                                                                       -- RenderMarkdownCode xxx guibg=#0c0f13
        RenderMarkdownH4{ fg = "#15191e", bg = "#6ebfbf", },                                                         -- RenderMarkdownH4 xxx guifg=#15191e guibg=#6ebfbf
        RenderMarkdownH4Bg{ fg = "#6ebfbf", bg = "#15191e", },                                                       -- RenderMarkdownH4Bg xxx guifg=#6ebfbf guibg=#15191e
        RenderMarkdownH3{ fg = "#15191e", bg = "#68b1e8", },                                                         -- RenderMarkdownH3 xxx guifg=#15191e guibg=#68b1e8
        RenderMarkdownH2{ fg = "#c678dd", bg = "#15191e", },                                                         -- RenderMarkdownH2 xxx guifg=#c678dd guibg=#15191e
        RenderMarkdownH3Bg{ fg = "#68b1e8", bg = "#15191e", },                                                       -- RenderMarkdownH3Bg xxx guifg=#68b1e8 guibg=#15191e
        RenderMarkdownH2Bg{ fg = "#15191e", bg = "#c678dd", },                                                       -- RenderMarkdownH2Bg xxx guifg=#15191e guibg=#c678dd
        RenderMarkdownH1{ fg = "#ef8080", bg = "#15191e", },                                                         -- RenderMarkdownH1 xxx guifg=#ef8080 guibg=#15191e
        NvimTreeGitStaged{ fg = "#f4d67b", },                                                                        -- NvimTreeGitStaged xxx guifg=#f4d67b
        NvimTreeGitStagedIcon{ NvimTreeGitStaged },                                                                  -- NvimTreeGitStagedIcon xxx links to NvimTreeGitStaged
        NvimTreeGitMerge{ fg = "#6ebfbf", },                                                                         -- NvimTreeGitMerge xxx guifg=#6ebfbf
        NvimTreeGitMergeIcon{ NvimTreeGitMerge },                                                                    -- NvimTreeGitMergeIcon xxx links to NvimTreeGitMerge
        NvimTreeFolderIcon{ fg = "#ef8080", },                                                                       -- NvimTreeFolderIcon xxx guifg=#ef8080
        NvimTreeBookmarkIcon{ NvimTreeFolderIcon },                                                                  -- NvimTreeBookmarkIcon xxx links to NvimTreeFolderIcon
        NvimTreeOpenedFolderIcon{ NvimTreeFolderIcon },                                                              -- NvimTreeOpenedFolderIcon xxx links to NvimTreeFolderIcon
        NvimTreeClosedFolderIcon{ NvimTreeFolderIcon },                                                              -- NvimTreeClosedFolderIcon xxx links to NvimTreeFolderIcon
        NvimTreeIndentMarker{ NvimTreeFolderIcon },                                                                  -- NvimTreeIndentMarker xxx links to NvimTreeFolderIcon
        TelescopeBorder{ bg = "#15191e", },                                                                          -- TelescopeBorder xxx guibg=#15191e
        NvimTreeGitDirty{ fg = "#ef8080", },                                                                         -- NvimTreeGitDirty xxx guifg=#ef8080
        NvimTreeGitDirtyIcon{ NvimTreeGitDirty },                                                                    -- NvimTreeGitDirtyIcon xxx links to NvimTreeGitDirty
        NvimTreeGitRenamed{ fg = "#f4d67b", },                                                                       -- NvimTreeGitRenamed xxx guifg=#f4d67b
        NvimTreeGitRenamedIcon{ NvimTreeGitRenamed },                                                                -- NvimTreeGitRenamedIcon xxx links to NvimTreeGitRenamed
        NvimTreeGitNew{ fg = "#95d987", },                                                                           -- NvimTreeGitNew xxx guifg=#95d987
        NvimTreeGitNewIcon{ NvimTreeGitNew },                                                                        -- NvimTreeGitNewIcon xxx links to NvimTreeGitNew
        NvimTreeGitDeleted{ fg = "#ef8080", },                                                                       -- NvimTreeGitDeleted xxx guifg=#ef8080
        NvimTreeGitDeletedIcon{ NvimTreeGitDeleted },                                                                -- NvimTreeGitDeletedIcon xxx links to NvimTreeGitDeleted
        TelescopeNormal{ bg = "#15191e", },                                                                          -- TelescopeNormal xxx guibg=#15191e
        RenderMarkdownCodeQuote{ bg = "#0c0f13", },                                                                  -- RenderMarkdownCodeQuote xxx guibg=#0c0f13
        RainbowDelimiterCyan{ fg = "#6ebfbf", },                                                                     -- RainbowDelimiterCyan xxx guifg=#6ebfbf
        RainbowDelimiterViolet{ fg = "#c678dd", },                                                                   -- RainbowDelimiterViolet xxx guifg=#c678dd
        RainbowDelimiterGreen{ fg = "#8acf7d", },                                                                    -- RainbowDelimiterGreen xxx guifg=#8acf7d
        RainbowDelimiterOrange{ fg = "#e5c76c", },                                                                   -- RainbowDelimiterOrange xxx guifg=#e5c76c
        RainbowDelimiterYellow{ fg = "#f4d67b", },                                                                   -- RainbowDelimiterYellow xxx guifg=#f4d67b
        RainbowDelimiterRed{ fg = "#ef8080", },                                                                      -- RainbowDelimiterRed xxx guifg=#ef8080
        sym"@markup.strong.markdown_inline"{ gui = "bold", fg = "#e5c76c", },                                        -- @markup.strong.markdown_inline xxx cterm=bold gui=bold guifg=#e5c76c
        sym"@lsp.type.builtin"{ fg = "#68b1e8", },                                                                   -- @lsp.type.builtin xxx guifg=#68b1e8
        SagaCount{ gui = "bold", fg = "#d9d9d9", bg = "#15191e", },                                                  -- SagaCount      xxx cterm=bold gui=bold guifg=#d9d9d9 guibg=#15191e
        LspCodeLensText{ fg = "#bcc2c1", },                                                                          -- LspCodeLensText xxx guifg=#bcc2c1
        sym"@namespace"{ fg = "#ef8080", },                                                                          -- @namespace     xxx guifg=#ef8080
        RainbowDelimiterBlue{ fg = "#73bbf2", },                                                                     -- RainbowDelimiterBlue xxx guifg=#73bbf2
        SagaVirtLine{ fg = "#444a4d", },                                                                             -- SagaVirtLine   xxx guifg=#444a4d
        SagaBeacon{ bg = "#c43963", },                                                                               -- SagaBeacon     xxx guibg=#c43963
        DiagnosticERRORReverse{ fg = "black", bg = "#e57676", },                                                     -- DiagnosticERRORReverse xxx guifg=Black guibg=#e57676
        DiagnosticWARNReverse{ fg = "black", bg = "#e5c76c", },                                                      -- DiagnosticWARNReverse xxx guifg=Black guibg=#e5c76c
        DiagnosticINFOReverse{ fg = "black", bg = "#68b1e8", },                                                      -- DiagnosticINFOReverse xxx guifg=Black guibg=#68b1e8
        DiagnosticHINTReverse{ fg = "black", bg = "#6ebfbf", },                                                      -- DiagnosticHINTReverse xxx guifg=Black guibg=#6ebfbf
        SagaButton{ fg = "#6ebfbf", },                                                                               -- SagaButton     xxx guifg=#6ebfbf
        SagaActionTitle{ fg = "black", bg = "#6ebfbf", },                                                            -- SagaActionTitle xxx guifg=Black guibg=#6ebfbf
        DapUIScope{ fg = "#00f1f5", },                                                                               -- DapUIScope     xxx guifg=#00f1f5
        DapUIType{ fg = "#d484ff", },                                                                                -- DapUIType      xxx guifg=#d484ff
        DapUIModifiedValue{ gui = "bold", fg = "#00f1f5", },                                                         -- DapUIModifiedValue xxx gui=bold guifg=#00f1f5
        DapUIDecoration{ fg = "#00f1f5", },                                                                          -- DapUIDecoration xxx guifg=#00f1f5
        DapUIThread{ fg = "#a9ff68", },                                                                              -- DapUIThread    xxx guifg=#a9ff68
        DapUIStoppedThread{ fg = "#00f1f5", },                                                                       -- DapUIStoppedThread xxx guifg=#00f1f5
        DapUISource{ fg = "#d484ff", },                                                                              -- DapUISource    xxx guifg=#d484ff
        DapUILineNumber{ fg = "#00f1f5", },                                                                          -- DapUILineNumber xxx guifg=#00f1f5
        DapUIBreakpointsLine{ DapUILineNumber },                                                                     -- DapUIBreakpointsLine xxx links to DapUILineNumber
        DapUIFloatBorder{ fg = "#00f1f5", },                                                                         -- DapUIFloatBorder xxx guifg=#00f1f5
        DapUIWatchesEmpty{ fg = "#f70067", },                                                                        -- DapUIWatchesEmpty xxx guifg=#f70067
        DapUIWatchesValue{ fg = "#a9ff68", },                                                                        -- DapUIWatchesValue xxx guifg=#a9ff68
        DapUIWatchesError{ fg = "#f70067", },                                                                        -- DapUIWatchesError xxx guifg=#f70067
        DapUIBreakpointsPath{ fg = "#00f1f5", },                                                                     -- DapUIBreakpointsPath xxx guifg=#00f1f5
        DapUIBreakpointsInfo{ fg = "#a9ff68", },                                                                     -- DapUIBreakpointsInfo xxx guifg=#a9ff68
        DapUIBreakpointsCurrentLine{ gui = "bold", fg = "#a9ff68", },                                                -- DapUIBreakpointsCurrentLine xxx gui=bold guifg=#a9ff68
        DapUICurrentFrameName{ DapUIBreakpointsCurrentLine },                                                        -- DapUICurrentFrameName xxx links to DapUIBreakpointsCurrentLine
        DapUIBreakpointsDisabledLine{ fg = "#424242", },                                                             -- DapUIBreakpointsDisabledLine xxx guifg=#424242
        DapUIStepOver{ fg = "#00f1f5", },                                                                            -- DapUIStepOver  xxx guifg=#00f1f5
        DapUIStepInto{ fg = "#00f1f5", },                                                                            -- DapUIStepInto  xxx guifg=#00f1f5
        DapUIStepBack{ fg = "#00f1f5", },                                                                            -- DapUIStepBack  xxx guifg=#00f1f5
        DapUIStepOut{ fg = "#00f1f5", },                                                                             -- DapUIStepOut   xxx guifg=#00f1f5
        DapUIStop{ fg = "#f70067", },                                                                                -- DapUIStop      xxx guifg=#f70067
        DapUIPlayPause{ fg = "#a9ff68", },                                                                           -- DapUIPlayPause xxx guifg=#a9ff68
        DapUIRestart{ fg = "#a9ff68", },                                                                             -- DapUIRestart   xxx guifg=#a9ff68
        DapUIUnavailable{ fg = "#424242", },                                                                         -- DapUIUnavailable xxx guifg=#424242
        DapUIWinSelect{ gui = "bold", fg = "#00f1f5", },                                                             -- DapUIWinSelect xxx ctermfg=14 gui=bold guifg=#00f1f5
        DapUINormalNC{ bg = "#07080d", },                                                                            -- DapUINormalNC  xxx guibg=#07080d
        DapUIPlayPauseNC{ fg = "#a9ff68", bg = "#07080d", },                                                         -- DapUIPlayPauseNC xxx guifg=#a9ff68 guibg=#07080d
        DapUIRestartNC{ fg = "#a9ff68", bg = "#07080d", },                                                           -- DapUIRestartNC xxx guifg=#a9ff68 guibg=#07080d
        DapUIStopNC{ fg = "#f70067", bg = "#07080d", },                                                              -- DapUIStopNC    xxx guifg=#f70067 guibg=#07080d
        DapUIUnavailableNC{ fg = "#424242", bg = "#07080d", },                                                       -- DapUIUnavailableNC xxx guifg=#424242 guibg=#07080d
        DapUIStepOverNC{ fg = "#00f1f5", bg = "#07080d", },                                                          -- DapUIStepOverNC xxx guifg=#00f1f5 guibg=#07080d
        DapUIStepIntoNC{ fg = "#00f1f5", bg = "#07080d", },                                                          -- DapUIStepIntoNC xxx guifg=#00f1f5 guibg=#07080d
        DapUIStepBackNC{ fg = "#00f1f5", bg = "#07080d", },                                                          -- DapUIStepBackNC xxx guifg=#00f1f5 guibg=#07080d
        DapUIStepOutNC{ fg = "#00f1f5", bg = "#07080d", },                                                           -- DapUIStepOutNC xxx guifg=#00f1f5 guibg=#07080d
        GitSignsStagedAdd{ fg = "#597b60", },                                                                        -- GitSignsStagedAdd xxx guifg=#597b60
        GitSignsStagedChange{ fg = "#467c7b", },                                                                     -- GitSignsStagedChange xxx guifg=#467c7b
        GitSignsStagedDelete{ fg = "#7f605c", },                                                                     -- GitSignsStagedDelete xxx guifg=#7f605c
        GitSignsStagedChangedelete{ fg = "#467c7b", },                                                               -- GitSignsStagedChangedelete xxx guifg=#467c7b
        GitSignsStagedTopdelete{ fg = "#7f605c", },                                                                  -- GitSignsStagedTopdelete xxx guifg=#7f605c
        GitSignsStagedAddNr{ fg = "#597b60", },                                                                      -- GitSignsStagedAddNr xxx guifg=#597b60
        GitSignsStagedChangeNr{ fg = "#467c7b", },                                                                   -- GitSignsStagedChangeNr xxx guifg=#467c7b
        GitSignsStagedDeleteNr{ fg = "#7f605c", },                                                                   -- GitSignsStagedDeleteNr xxx guifg=#7f605c
        GitSignsStagedChangedeleteNr{ fg = "#467c7b", },                                                             -- GitSignsStagedChangedeleteNr xxx guifg=#467c7b
        GitSignsStagedTopdeleteNr{ fg = "#7f605c", },                                                                -- GitSignsStagedTopdeleteNr xxx guifg=#7f605c
        GitSignsStagedAddLn{ fg = "#45673e", },                                                                      -- GitSignsStagedAddLn xxx guifg=#45673e
        GitSignsStagedChangeLn{ fg = "#7a6b3d", },                                                                   -- GitSignsStagedChangeLn xxx guifg=#7a6b3d
        GitSignsStagedChangedeleteLn{ fg = "#7a6b3d", },                                                             -- GitSignsStagedChangedeleteLn xxx guifg=#7a6b3d
        GitSignsStagedAddCul{ fg = "#597b60", },                                                                     -- GitSignsStagedAddCul xxx guifg=#597b60
        GitSignsStagedChangeCul{ fg = "#467c7b", },                                                                  -- GitSignsStagedChangeCul xxx guifg=#467c7b
        GitSignsStagedDeleteCul{ fg = "#7f605c", },                                                                  -- GitSignsStagedDeleteCul xxx guifg=#7f605c
        GitSignsStagedChangedeleteCul{ fg = "#467c7b", },                                                            -- GitSignsStagedChangedeleteCul xxx guifg=#467c7b
        GitSignsStagedTopdeleteCul{ fg = "#7f605c", },                                                               -- GitSignsStagedTopdeleteCul xxx guifg=#7f605c
        FzfLuaBackdrop{ bg = "black", },                                                                             -- FzfLuaBackdrop xxx guibg=Black
        FzfLuaHeaderBind{ fg = "blanchedalmond", },                                                                  -- FzfLuaHeaderBind xxx guifg=BlanchedAlmond
        FzfLuaHeaderText{ fg = "brown1", },                                                                          -- FzfLuaHeaderText xxx guifg=Brown1
        FzfLuaPathColNr{ fg = "cadetblue1", },                                                                       -- FzfLuaPathColNr xxx guifg=CadetBlue1
        FzfLuaPathLineNr{ fg = "lightgreen", },                                                                      -- FzfLuaPathLineNr xxx guifg=LightGreen
        FzfLuaLiveSym{ fg = "brown1", },                                                                             -- FzfLuaLiveSym  xxx guifg=Brown1
        FzfLuaBufName{ fg = "lightmagenta", },                                                                       -- FzfLuaBufName  xxx guifg=LightMagenta
        FzfLuaBufNr{ fg = "blanchedalmond", },                                                                       -- FzfLuaBufNr    xxx guifg=BlanchedAlmond
        FzfLuaBufFlagCur{ fg = "brown1", },                                                                          -- FzfLuaBufFlagCur xxx guifg=Brown1
        FzfLuaBufFlagAlt{ fg = "cadetblue1", },                                                                      -- FzfLuaBufFlagAlt xxx guifg=CadetBlue1
        FzfLuaTabTitle{ gui = "bold", fg = "lightskyblue1", },                                                       -- FzfLuaTabTitle xxx cterm=bold gui=bold guifg=LightSkyBlue1
        FzfLuaTabMarker{ gui = "bold", fg = "blanchedalmond", },                                                     -- FzfLuaTabMarker xxx cterm=bold gui=bold guifg=BlanchedAlmond
        NvimTreeWindowPicker{ gui = "bold", fg = "#ededed", bg = "#4493c8", },                                       -- NvimTreeWindowPicker xxx ctermfg=15 ctermbg=4 gui=bold guifg=#ededed guibg=#4493c8
        IlluminatedWordText{ gui = "underline", },                                                                   -- IlluminatedWordText xxx gui=underline
        IlluminatedWordRead{ gui = "underline", },                                                                   -- IlluminatedWordRead xxx gui=underline
        IlluminatedWordWrite{ gui = "underline", },                                                                  -- IlluminatedWordWrite xxx gui=underline
        BufferLineSeparatorSelected{ fg = "#0b0d10", bg = "#15191e", },                                              -- BufferLineSeparatorSelected xxx guifg=#0b0d10 guibg=#15191e
        BufferLineDuplicate{ gui = "italic", fg = "#575f60", bg = "#0f1216", },                                      -- BufferLineDuplicate xxx cterm=italic gui=italic guifg=#575f60 guibg=#0f1216
        BufferLineDuplicateVisible{ gui = "italic", fg = "#575f60", bg = "#13171b", },                               -- BufferLineDuplicateVisible xxx cterm=italic gui=italic guifg=#575f60 guibg=#13171b
        BufferLineDuplicateSelected{ gui = "italic", fg = "#575f60", bg = "#15191e", },                              -- BufferLineDuplicateSelected xxx cterm=italic gui=italic guifg=#575f60 guibg=#15191e
        BufferLineBackground{ fg = "#5c6466", bg = "#0f1216", },                                                     -- BufferLineBackground xxx guifg=#5c6466 guibg=#0f1216
        BufferLineModifiedVisible{ fg = "#8acf7d", bg = "#13171b", },                                                -- BufferLineModifiedVisible xxx guifg=#8acf7d guibg=#13171b
        BufferLineErrorDiagnosticSelected{ sp = "#ab5858", fg = "#ab5858", bg = "#15191e", gui = "bold,italic", },   -- BufferLineErrorDiagnosticSelected xxx cterm=bold,italic gui=bold,italic guifg=#ab5858 guibg=#15191e guisp=#ab5858
        BufferLineErrorDiagnosticVisible{ fg = "#454b4c", bg = "#13171b", },                                         -- BufferLineErrorDiagnosticVisible xxx guifg=#454b4c guibg=#13171b
        BufferLineErrorDiagnostic{ sp = "#ab5858", fg = "#454b4c", bg = "#0f1216", },                                -- BufferLineErrorDiagnostic xxx guifg=#454b4c guibg=#0f1216 guisp=#ab5858
        BufferLineErrorSelected{ sp = "#e57676", fg = "#e57676", bg = "#15191e", gui = "bold,italic", },             -- BufferLineErrorSelected xxx cterm=bold,italic gui=bold,italic guifg=#e57676 guibg=#15191e guisp=#e57676
        BufferLineErrorVisible{ fg = "#5c6466", bg = "#13171b", },                                                   -- BufferLineErrorVisible xxx guifg=#5c6466 guibg=#13171b
        BufferLineWarningDiagnosticSelected{ sp = "#ab9551", fg = "#ab9551", bg = "#15191e", gui = "bold,italic", }, -- BufferLineWarningDiagnosticSelected xxx cterm=bold,italic gui=bold,italic guifg=#ab9551 guibg=#15191e guisp=#ab9551
        BufferLineWarningDiagnosticVisible{ fg = "#454b4c", bg = "#13171b", },                                       -- BufferLineWarningDiagnosticVisible xxx guifg=#454b4c guibg=#13171b
        BufferLineWarningDiagnostic{ sp = "#ab9551", fg = "#454b4c", bg = "#0f1216", },                              -- BufferLineWarningDiagnostic xxx guifg=#454b4c guibg=#0f1216 guisp=#ab9551
        BufferLineWarningSelected{ sp = "#e5c76c", fg = "#e5c76c", bg = "#15191e", gui = "bold,italic", },           -- BufferLineWarningSelected xxx cterm=bold,italic gui=bold,italic guifg=#e5c76c guibg=#15191e guisp=#e5c76c
        BufferLineInfo{ sp = "#68b1e8", fg = "#5c6466", bg = "#0f1216", },                                           -- BufferLineInfo xxx guifg=#5c6466 guibg=#0f1216 guisp=#68b1e8
        BufferLineInfoDiagnosticSelected{ sp = "#4e84ae", fg = "#4e84ae", bg = "#15191e", gui = "bold,italic", },    -- BufferLineInfoDiagnosticSelected xxx cterm=bold,italic gui=bold,italic guifg=#4e84ae guibg=#15191e guisp=#4e84ae
        BufferLineInfoDiagnosticVisible{ fg = "#454b4c", bg = "#13171b", },                                          -- BufferLineInfoDiagnosticVisible xxx guifg=#454b4c guibg=#13171b
        BufferLineInfoDiagnostic{ sp = "#4e84ae", fg = "#454b4c", bg = "#0f1216", },                                 -- BufferLineInfoDiagnostic xxx guifg=#454b4c guibg=#0f1216 guisp=#4e84ae
        BufferLineInfoSelected{ sp = "#68b1e8", fg = "#68b1e8", bg = "#15191e", gui = "bold,italic", },              -- BufferLineInfoSelected xxx cterm=bold,italic gui=bold,italic guifg=#68b1e8 guibg=#15191e guisp=#68b1e8
        BufferLineInfoVisible{ fg = "#5c6466", bg = "#13171b", },                                                    -- BufferLineInfoVisible xxx guifg=#5c6466 guibg=#13171b
        BufferLineTabClose{ bg = "#15191e", },                                                                       -- BufferLineTabClose xxx guibg=#15191e
        BufferLineHintDiagnosticVisible{ fg = "#454b4c", bg = "#13171b", },                                          -- BufferLineHintDiagnosticVisible xxx guifg=#454b4c guibg=#13171b
        BufferLineHintDiagnostic{ sp = "#528f8f", fg = "#454b4c", bg = "#0f1216", },                                 -- BufferLineHintDiagnostic xxx guifg=#454b4c guibg=#0f1216 guisp=#528f8f
        BufferLineHintSelected{ sp = "#6ebfbf", fg = "#6ebfbf", bg = "#15191e", gui = "bold,italic", },              -- BufferLineHintSelected xxx cterm=bold,italic gui=bold,italic guifg=#6ebfbf guibg=#15191e guisp=#6ebfbf
        BufferLineHintVisible{ fg = "#5c6466", bg = "#13171b", },                                                    -- BufferLineHintVisible xxx guifg=#5c6466 guibg=#13171b
        BufferLineDiagnosticSelected{ gui = "bold,italic", fg = "#8d9190", bg = "#15191e", },                        -- BufferLineDiagnosticSelected xxx cterm=bold,italic gui=bold,italic guifg=#8d9190 guibg=#15191e
        BufferLineDiagnosticVisible{ fg = "#454b4c", bg = "#13171b", },                                              -- BufferLineDiagnosticVisible xxx guifg=#454b4c guibg=#13171b
        BufferLineNumbersVisible{ fg = "#5c6466", bg = "#13171b", },                                                 -- BufferLineNumbersVisible xxx guifg=#5c6466 guibg=#13171b
        BufferLineNumbersSelected{ gui = "bold,italic", fg = "#bcc2c1", bg = "#15191e", },                           -- BufferLineNumbersSelected xxx cterm=bold,italic gui=bold,italic guifg=#bcc2c1 guibg=#15191e
        BufferLineBuffer{ fg = "#5c6466", bg = "#0f1216", },                                                         -- BufferLineBuffer xxx guifg=#5c6466 guibg=#0f1216
        BufferLineBufferVisible{ fg = "#5c6466", bg = "#13171b", },                                                  -- BufferLineBufferVisible xxx guifg=#5c6466 guibg=#13171b
        BufferLineCloseButtonSelected{ fg = "#bcc2c1", bg = "#15191e", },                                            -- BufferLineCloseButtonSelected xxx guifg=#bcc2c1 guibg=#15191e
        BufferLineCloseButtonVisible{ fg = "#5c6466", bg = "#13171b", },                                             -- BufferLineCloseButtonVisible xxx guifg=#5c6466 guibg=#13171b
        BufferLineCloseButton{ fg = "#5c6466", bg = "#0f1216", },                                                    -- BufferLineCloseButton xxx guifg=#5c6466 guibg=#0f1216
        BufferLineTabSelected{ fg = "#73bbf2", bg = "#15191e", },                                                    -- BufferLineTabSelected xxx guifg=#73bbf2 guibg=#15191e
        BufferLineGroupLabel{ fg = "#0b0d10", bg = "#5c6466", },                                                     -- BufferLineGroupLabel xxx guifg=#0b0d10 guibg=#5c6466
        BufferLineGroupSeparator{ fg = "#5c6466", bg = "#0b0d10", },                                                 -- BufferLineGroupSeparator xxx guifg=#5c6466 guibg=#0b0d10
        BufferLineTruncMarker{ fg = "#5c6466", bg = "#0b0d10", },                                                    -- BufferLineTruncMarker xxx guifg=#5c6466 guibg=#0b0d10
        BufferLineFill{ fg = "#5c6466", bg = "#0b0d10", },                                                           -- BufferLineFill xxx guifg=#5c6466 guibg=#0b0d10
        BufferLinePick{ gui = "bold,italic", fg = "#e57676", bg = "#0f1216", },                                      -- BufferLinePick xxx cterm=bold,italic gui=bold,italic guifg=#e57676 guibg=#0f1216
        BufferLineSeparator{ fg = "#0b0d10", bg = "#0f1216", },                                                      -- BufferLineSeparator xxx guifg=#0b0d10 guibg=#0f1216
        BufferLineWarning{ sp = "#e5c76c", fg = "#5c6466", bg = "#0f1216", },                                        -- BufferLineWarning xxx guifg=#5c6466 guibg=#0f1216 guisp=#e5c76c
        BufferLineModifiedSelected{ fg = "#8acf7d", bg = "#15191e", },                                               -- BufferLineModifiedSelected xxx guifg=#8acf7d guibg=#15191e
        BufferLineModified{ fg = "#8acf7d", bg = "#0f1216", },                                                       -- BufferLineModified xxx guifg=#8acf7d guibg=#0f1216
        BufferLineWarningVisible{ fg = "#5c6466", bg = "#13171b", },                                                 -- BufferLineWarningVisible xxx guifg=#5c6466 guibg=#13171b
        BufferLineNumbers{ fg = "#5c6466", bg = "#0f1216", },                                                        -- BufferLineNumbers xxx guifg=#5c6466 guibg=#0f1216
        BufferLineHintDiagnosticSelected{ sp = "#528f8f", fg = "#528f8f", bg = "#15191e", gui = "bold,italic", },    -- BufferLineHintDiagnosticSelected xxx cterm=bold,italic gui=bold,italic guifg=#528f8f guibg=#15191e guisp=#528f8f
        BufferLineTab{ bg = "#0c0f13", },                                                                            -- BufferLineTab  xxx guibg=#0c0f13
        BufferLineError{ sp = "#e57676", fg = "#5c6466", bg = "#0f1216", },                                          -- BufferLineError xxx guifg=#5c6466 guibg=#0f1216 guisp=#e57676
        BufferLineHint{ sp = "#6ebfbf", fg = "#5c6466", bg = "#0f1216", },                                           -- BufferLineHint xxx guifg=#5c6466 guibg=#0f1216 guisp=#6ebfbf
        BufferLineBufferSelected{ gui = "bold,italic", fg = "#bcc2c1", bg = "#15191e", },                            -- BufferLineBufferSelected xxx cterm=bold,italic gui=bold,italic guifg=#bcc2c1 guibg=#15191e
        BufferLineDiagnostic{ fg = "#454b4c", bg = "#0f1216", },                                                     -- BufferLineDiagnostic xxx guifg=#454b4c guibg=#0f1216
        BufferLineOffsetSeparator{ fg = "#bcc2c1", bg = "#0b0d10", },                                                -- BufferLineOffsetSeparator xxx guifg=#bcc2c1 guibg=#0b0d10
        BufferLinePickVisible{ gui = "bold,italic", fg = "#e57676", bg = "#13171b", },                               -- BufferLinePickVisible xxx cterm=bold,italic gui=bold,italic guifg=#e57676 guibg=#13171b
        BufferLinePickSelected{ gui = "bold,italic", fg = "#e57676", bg = "#15191e", },                              -- BufferLinePickSelected xxx cterm=bold,italic gui=bold,italic guifg=#e57676 guibg=#15191e
        BufferLineIndicatorVisible{ fg = "#13171b", bg = "#13171b", },                                               -- BufferLineIndicatorVisible xxx guifg=#13171b guibg=#13171b
        BufferLineIndicatorSelected{ fg = "#73bbf2", bg = "#15191e", },                                              -- BufferLineIndicatorSelected xxx guifg=#73bbf2 guibg=#15191e
        BufferLineTabSeparatorSelected{ fg = "#0b0d10", bg = "#15191e", },                                           -- BufferLineTabSeparatorSelected xxx guifg=#0b0d10 guibg=#15191e
        BufferLineTabSeparator{ fg = "#0b0d10", bg = "#0f1216", },                                                   -- BufferLineTabSeparator xxx guifg=#0b0d10 guibg=#0f1216
        BufferLineSeparatorVisible{ fg = "#0b0d10", bg = "#13171b", },                                               -- BufferLineSeparatorVisible xxx guifg=#0b0d10 guibg=#13171b
        NeotestPassed{ fg = "#96f291", },                                                                            -- NeotestPassed  xxx ctermfg=10 guifg=#96f291
        NeotestFailed{ fg = "#f70067", },                                                                            -- NeotestFailed  xxx ctermfg=9 guifg=#f70067
        NeotestRunning{ fg = "#ffec63", },                                                                           -- NeotestRunning xxx ctermfg=11 guifg=#ffec63
        NeotestSkipped{ fg = "#00f1f5", },                                                                           -- NeotestSkipped xxx ctermfg=14 guifg=#00f1f5
        NeotestNamespace{ fg = "#d484ff", },                                                                         -- NeotestNamespace xxx ctermfg=13 guifg=#d484ff
        NeotestFocused{ gui = "bold,underline", },                                                                   -- NeotestFocused xxx cterm=bold,underline gui=bold,underline
        NeotestFile{ fg = "#00f1f5", },                                                                              -- NeotestFile    xxx ctermfg=14 guifg=#00f1f5
        NeotestDir{ fg = "#00f1f5", },                                                                               -- NeotestDir     xxx ctermfg=14 guifg=#00f1f5
        NeotestIndent{ fg = "#8b8b8b", },                                                                            -- NeotestIndent  xxx ctermfg=248 guifg=#8b8b8b
        NeotestExpandMarker{ fg = "#8094b4", },                                                                      -- NeotestExpandMarker xxx ctermfg=248 guifg=#8094b4
        NeotestAdapterName{ fg = "#f70067", },                                                                       -- NeotestAdapterName xxx ctermfg=9 guifg=#f70067
        NeotestWinSelect{ gui = "bold", fg = "#00f1f5", },                                                           -- NeotestWinSelect xxx ctermfg=14 gui=bold guifg=#00f1f5
        NeotestMarked{ gui = "bold", fg = "#f79000", },                                                              -- NeotestMarked  xxx ctermfg=130 gui=bold guifg=#f79000
        NeotestTarget{ fg = "#f70067", },                                                                            -- NeotestTarget  xxx ctermfg=9 guifg=#f70067
        NeotestWatching{ fg = "#ffec63", },                                                                          -- NeotestWatching xxx ctermfg=11 guifg=#ffec63
        HopNextKey{ gui = "bold", fg = "#ff007c", },                                                                 -- HopNextKey     xxx cterm=bold ctermfg=198 gui=bold guifg=#ff007c
        HopNextKey1{ gui = "bold", fg = "#00dfff", },                                                                -- HopNextKey1    xxx cterm=bold ctermfg=45 gui=bold guifg=#00dfff
        HopNextKey2{ fg = "#2b8db3", },                                                                              -- HopNextKey2    xxx ctermfg=33 guifg=#2b8db3
        HopUnmatched{ sp = "#666666", fg = "#666666", bg = "bg", },                                                  -- HopUnmatched   xxx ctermfg=242 guifg=#666666 guibg=bg guisp=#666666
        NeoCodeiumSuggestion{ fg = "#808080", },                                                                     -- NeoCodeiumSuggestion xxx ctermfg=244 guifg=#808080
        NeoCodeiumLabel{ gui = "bold,reverse", fg = "#68b1e8", },                                                    -- NeoCodeiumLabel xxx cterm=bold,reverse ctermfg=244 gui=bold,reverse guifg=#68b1e8
        BufferLineDevIconCpp{ bg = "#0f1216", },                                                                     -- BufferLineDevIconCpp xxx guibg=#0f1216
        BufferLineDevIconH{ bg = "#0f1216", },                                                                       -- BufferLineDevIconH xxx guibg=#0f1216
        BufferLineDevIconcuda{ bg = "#0f1216", },                                                                    -- BufferLineDevIconcuda xxx guibg=#0f1216
        BufferLineDevIconPy{ bg = "#0f1216", },                                                                      -- BufferLineDevIconPy xxx guibg=#0f1216
        BufferLineDevIconJson{ bg = "#0f1216", },                                                                    -- BufferLineDevIconJson xxx guibg=#0f1216
        BufferLineDevIconDefault{ bg = "#0f1216", },                                                                 -- BufferLineDevIconDefault xxx guibg=#0f1216
        BufferLineDevIconcudaSelected{ bg = "#15191e", },                                                            -- BufferLineDevIconcudaSelected xxx guibg=#15191e
    }
end)
return theme
