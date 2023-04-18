-- 
-- Use :Inspect to see the field of the varieble
--
local cmd = vim.cmd

-- local colorscheme = "catppuccin"
-- local colorscheme = "tokyonight"
-- local colorscheme = "gruvbox-baby"
-- local colorscheme = "gruvbox"
local colorscheme = "onedark"

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
            bg = "#202123",
            yellow = "#D7C893",
        },
        -- cursorline = "#36383c",
    },
    highlights = {
        WhichKeyFloat = { bg = "#202123" },
        DiagnosticUnderlineError = { sp = "${red}", style = "undercurl" },
        DiagnosticUnderlineWarn = { sp = "${yellow}", style = "undercurl" },
        DiagnosticUnderlineInfo = { sp = "${blue}", style = "undercurl" },
        DiagnosticUnderlineHint = { sp = "${cyan}", style = "undercurl" },
        PmenuSel = { bg = "#2d3031" },
    },
    options = {
        cursorline = true
    }
})
local function config_onedarkpro()
    cmd "hi @property guifg=#C0BAC7"
    cmd "hi @lsp.type.macro.cpp guifg=#A09A29"
    cmd "hi Type guifg=#C678DD"
    cmd "hi @parameter guifg=#ABB2BF"
    cmd "hi @PreProc guifg=#E5C07B"
    cmd "hi Include guifg=#E5C07B"
    cmd "hi Define guifg=#E5C07B"
    cmd "hi @lsp.type.type.cpp guifg=#D7C893"
    cmd "hi @lsp.typemod.function.defaultLibrary.cpp guifg=#61AFEF"
    cmd "hi @storageclass.cpp guifg=#C678DD"
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
