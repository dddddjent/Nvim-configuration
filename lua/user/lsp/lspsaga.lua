local keymap = vim.keymap.set
local saga = require('lspsaga')

saga.setup({
    ui = {
        code_action = "",
    },
    symbol_in_winbar = {
        enable = false,
    }
})

keymap("n", "gh", "<cmd>Lspsaga finder<CR>", { silent = true })
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })
keymap("n", "<a-cr>", "<cmd>Lspsaga code_action<CR>", { silent = true })
