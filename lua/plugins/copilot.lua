return {
    "github/copilot.vim",
    lazy = false,
    init = function()
        vim.g.copilot_node_command = MISE_DEP_DIR .. "/node/latest/bin/node"
        vim.g.copilot_no_tab_map = true
    end,
    keys = {
        {
            "<C-f>",
            'copilot#Accept("\\<CR>")',
            desc = "Copilot Accept",
            expr = true,
            replace_keycodes = false,
            mode = "i",
        },
        {
            "<C-n>",
            "<Plug>(copilot-next)",
            desc = "Copilot Next",
            mode = "i",
        },
        {
            "<C-x>",
            "<Plug>(copilot-dismiss)",
            desc = "Copilot dismiss",
            mode = "i",
        },
    }
}
