local colorscheme = "catppuccin"
-- local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

local cmd = vim.cmd
cmd "hi @comment guifg=#a0a0a0"

-- For transparency
cmd "au ColorScheme * hi Normal ctermbg=none "
cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"
cmd "au ColorScheme * hi NormalNC ctermbg=none guibg=none"
cmd "au ColorScheme * hi MsgArea ctermbg=none guibg=none"
cmd "au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none"
cmd "au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none"
cmd "au ColorScheme * hi BufferLineFill guibg=none"
cmd "au ColorScheme * hi BufferLineBackground gueifg=#7a7c9e"
cmd "au ColorScheme * hi BufferLineBufferSelecteed guifg=white gui=none"
cmd "let &fcs='eob: '"

if not status_ok then
    return
end
