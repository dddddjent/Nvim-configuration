return {
    "github/copilot.vim",
    lazy = false,
    init = function()
        -- copilot.vim starts the language server via argv list (no shell), so
        -- we must use list-form to apply env vars.
        local xdg_env = {
            "XDG_CONFIG_HOME=" .. vim.fn.expand("~/.config"),
            "XDG_CACHE_HOME=" .. vim.fn.expand("~/.cache"),
            "XDG_STATE_HOME=" .. vim.fn.expand("~/.local/state"),
            "XDG_DATA_HOME=" .. vim.fn.expand("~/.local/share"),
        }

        -- copilot.vim prefers launching the language server via `npx`, which
        -- bypasses g:copilot_node_command. Wrap npx to force user-writable XDG.
        vim.g.copilot_npx_command = vim.list_extend({ "env" }, vim.list_extend(vim.deepcopy(xdg_env), { "npx" }))

        -- Fallback path (used if npx is disabled):
        vim.g.copilot_node_command = vim.list_extend({ "env" }, vim.list_extend(vim.deepcopy(xdg_env), {
            MISE_DEP_DIR .. "/node/latest/bin/node",
        }))

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
