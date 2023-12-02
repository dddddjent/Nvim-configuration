vim.g.gruvbox_baby_background_color = "dark" -- Has to be set before colorscheme

local cmd = vim.cmd
return {
    post_set_scheme = function()
        -- local colors = require("gruvbox-baby.colors").config()
        cmd "hi @type.builtin guifg=#7fa2ac"
        cmd "hi @namespace guifg=#458588"
        cmd "hi @comment guifg=#a0a0a0"
        cmd "hi @property guifg=#bdb76b"
        cmd "hi @field guifg=#bdb76b"
        cmd "hi @parameter guifg=#ebdbb2"
    end
}
