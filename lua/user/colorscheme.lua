local colorscheme = "catppuccin"
-- local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.cmd "hi @comment guifg=#a0a0a0"

if not status_ok then
    return
end
