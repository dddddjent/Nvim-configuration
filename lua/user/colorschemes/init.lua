-- Use :Inspect to see the field of the varieble

-- local colorscheme = "catppuccin"
-- local colorscheme = "tokyonight"
-- local colorscheme = "gruvbox-baby"
-- local colorscheme = "gruvbox"
local colorscheme = "onedark"
-- local colorscheme = "everblush"

local scheme = require("user.colorschemes." .. colorscheme)
vim.cmd("colorscheme " .. colorscheme)
if scheme ~= true then -- post_set_scheme exists?
    scheme.post_set_scheme()
end
