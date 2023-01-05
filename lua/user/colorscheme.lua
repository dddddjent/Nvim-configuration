local cmd = vim.cmd

-- local colorscheme = "catppuccin"
-- local colorscheme = "tokyonight"
local colorscheme = "gruvbox-baby"

vim.g.gruvbox_baby_background_color = "dark" -- Has to be set before colorscheme
function config_gruvbox()
    local colors = require("gruvbox-baby.colors").config()
    cmd "hi @type.builtin guifg=#7fa2ac"
    cmd "hi @namespace guifg=#458588"
    cmd "hi @comment guifg=#a0a0a0"
    cmd "hi @parent guifg=#bdb76b"
end

require("catppuccin").setup({
    styles = {
        loops = {},
        functions = {"bold"},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
})
function config_catppuccin()
    cmd "hi @comment guifg=#a0a0a0"
end

function config_colorscheme(color_scheme)
    if color_scheme == "gruvbox-baby" then
        config_gruvbox()
    elseif color_scheme == "catppuccin" then
        config_catppuccin()
    elseif color_scheme == "tokyonight" then
    end
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
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

if not status_ok then
    return
end
