-- Use :Inspect to see the field of the varieble
local cmd = vim.cmd

-- local colorscheme = "catppuccin"
-- local colorscheme = "tokyonight"
-- local colorscheme = "gruvbox-baby"
-- local colorscheme = "gruvbox"
local colorscheme = "onedark"
-- local colorscheme = "everblush"

local scheme = require("user.colorschemes." .. colorscheme)
vim.cmd("colorscheme " .. colorscheme)
-- For transparency
cmd "au ColorScheme * hi Normal ctermbg=none "
cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"
cmd "au ColorScheme * hi NormalNC ctermbg=none guibg=none"
cmd "au ColorScheme * hi MsgArea ctermbg=none guibg=none"
cmd "au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none"
cmd "au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none"
cmd "let &fcs='eob: '"

scheme.post_set_scheme()


-- require("gruvbox").setup({
--     undercurl = true,
--     underline = true,
--     bold = true,
--     -- italic = true,
--     strikethrough = true,
--     invert_selection = false,
--     invert_signs = false,
--     invert_tabline = false,
--     invert_intend_guides = false,
--     inverse = true,    -- invert background for search, diffs, statuslines and errors
--     contrast = "hard", -- can be "hard", "soft" or empty string
--     palette_overrides = {
--         dark1 = "#1d2021",
--     },
--     dim_inactive = false,
--     transparent_mode = false,
--     overrides = {
--         CursorLine = { bg = "#3c3836" },
--         Pmenu = { bg = "#1d2021" },
--         LspSignatureActiveParameter = { fg = "#d79921" },
--     }
-- })
-- local function config_gruvbox()
--     cmd "hi @namespace guifg=#458588"
-- end
--
-- vim.g.gruvbox_baby_background_color = "dark" -- Has to be set before colorscheme
-- local function config_gruvbox_baby()
--     -- local colors = require("gruvbox-baby.colors").config()
--     cmd "hi @type.builtin guifg=#7fa2ac"
--     cmd "hi @namespace guifg=#458588"
--     cmd "hi @comment guifg=#a0a0a0"
--     cmd "hi @property guifg=#bdb76b"
--     cmd "hi @field guifg=#bdb76b"
--     cmd "hi @parameter guifg=#ebdbb2"
-- end
--
-- local palette = {
--     color0 = '#232a2d',
--     color1 = '#e57474',
--     color2 = '#8ccf7e',
--     color3 = '#e5c76b',
--     color4 = '#67b0e8',
--     color5 = '#c47fd5',
--     color6 = '#6cbfbf',
--     color7 = '#b3b9b8',
--     color8 = '#2d3437',
--     color9 = '#ef7e7e',
--     color10 = '#96d988',
--     color11 = '#f4d67a',
--     color12 = '#71baf2',
--     color13 = '#ce89df',
--     color14 = '#67cbe7',
--     color15 = '#bdc3c2',
--     comment = '#404749',
--     contrast = '#161d1f',
--     background = '#141b1e',
--     foreground = '#dadada',
--     cursorline = '#2c3333',
--     none = 'NONE',
-- }
-- local function config_colorscheme(color_scheme)
--     if color_scheme == "gruvbox-baby" then
--         config_gruvbox_baby()
--     elseif color_scheme == "tokyonight" then
--     elseif color_scheme == "gruvbox" then
--         config_gruvbox()
--     end
-- end
        vim.cmd "hi NormalFloat guibg=#15191f"
