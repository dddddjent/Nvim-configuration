--
-- Use :Inspect to see the field of the varieble
--
local cmd = vim.cmd

-- local colorscheme = "catppuccin"
-- local colorscheme = "tokyonight"
-- local colorscheme = "gruvbox-baby"
-- local colorscheme = "gruvbox"
local colorscheme = "onedark"
-- local colorscheme = "everblush"

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
    inverse = true, -- invert background for search, diffs, statuslines and errors
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
local function config_gruvbox()
    cmd "hi @namespace guifg=#458588"
end

vim.g.gruvbox_baby_background_color = "dark" -- Has to be set before colorscheme
local function config_gruvbox_baby()
    -- local colors = require("gruvbox-baby.colors").config()
    cmd "hi @type.builtin guifg=#7fa2ac"
    cmd "hi @namespace guifg=#458588"
    cmd "hi @comment guifg=#a0a0a0"
    cmd "hi @property guifg=#bdb76b"
    cmd "hi @field guifg=#bdb76b"
    cmd "hi @parameter guifg=#ebdbb2"
end

local function config_catppuccin()
    cmd "hi @comment guifg=#a0a0a0"
end

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
        -- DiagnosticUnderlineInfo = { sp = "${blue}", style = "undercurl" },
        DiagnosticUnderlineInfo = { sp = "${purple}", style = "undercurl" },
        DiagnosticUnderlineHint = { sp = "${cyan}", style = "undercurl" },
    },
    options = {
        -- cursorline = true
    }
})
local palette = {
    color0 = '#232a2d',
    color1 = '#e57474',
    color2 = '#8ccf7e',
    color3 = '#e5c76b',
    color4 = '#67b0e8',
    color5 = '#c47fd5',
    color6 = '#6cbfbf',
    color7 = '#b3b9b8',
    color8 = '#2d3437',
    color9 = '#ef7e7e',
    color10 = '#96d988',
    color11 = '#f4d67a',
    color12 = '#71baf2',
    color13 = '#ce89df',
    color14 = '#67cbe7',
    color15 = '#bdc3c2',
    comment = '#404749',
    contrast = '#161d1f',
    background = '#141b1e',
    foreground = '#dadada',
    cursorline = '#2c3333',
    none = 'NONE',
}
local function config_onedarkpro()
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
end

local function config_colorscheme(color_scheme)
    if color_scheme == "gruvbox-baby" then
        config_gruvbox_baby()
    elseif color_scheme == "catppuccin" then
        config_catppuccin()
    elseif color_scheme == "tokyonight" then
    elseif color_scheme == "gruvbox" then
        config_gruvbox()
    elseif color_scheme == "onedark" then
        config_onedarkpro()
    end
end

-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.cmd("colorscheme " .. colorscheme)
-- For transparency
cmd "au ColorScheme * hi Normal ctermbg=none "
cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"
cmd "au ColorScheme * hi NormalNC ctermbg=none guibg=none"
cmd "au ColorScheme * hi MsgArea ctermbg=none guibg=none"
cmd "au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none"
cmd "au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none"
-- cmd "au ColorScheme * hi BufferLineFill guibg=none"
-- cmd "au ColorScheme * hi BufferLineBackground gueifg=#7a7c9e"
-- cmd "au ColorScheme * hi BufferLineBufferSelecteed guifg=white gui=none"
cmd "let &fcs='eob: '"
-- Configure colorscheme
config_colorscheme(colorscheme)

-- if not status_ok then
--     return
-- end
