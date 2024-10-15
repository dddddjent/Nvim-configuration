local neocodeium = require("neocodeium")

-- '' is for avante edit input
local filetypes = {
    '',
    'DressingInput',
}
neocodeium.setup(
    {
        -- function accepts one argument `bufnr`
        filter = function(bufnr)
            if vim.tbl_contains(filetypes, vim.api.nvim_get_option_value('filetype', { buf = bufnr })) then
                return false
            end
            return true
        end
    }
)

vim.keymap.set("i", "<c-f>", neocodeium.accept)
vim.keymap.set("i", "<c-c>", neocodeium.clear)
vim.keymap.set("i", "<c-n>", neocodeium.cycle_or_complete)
vim.keymap.set("i", "<c-p>", function() neocodeium.cycle_or_complete(-1) end)

require "which-key".register({
    a = {
        ["c"] = { "<cmd>NeoCodeium! toggle<cr>", "NeoCodeium" },
    }
}, WHICH_KEY_OPTS)
