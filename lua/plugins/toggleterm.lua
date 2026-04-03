function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<C-q>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-w>h', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-w>j', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-w>k', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-w>l', [[<C-\><C-n><C-W>l]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<Down>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<Up>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<Nop>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<Nop>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

function _LAZYGIT_TOGGLE()
    vim.cmd("ToggleTerm direction=float")
    vim.cmd("TermExec cmd='lazygit'")
end

return {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    opts = {
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = "curved",
            winblend = 0,
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        },
    }
}
