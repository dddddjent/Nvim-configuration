local keymap = vim.keymap.set
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", KEY_OPTS)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", KEY_OPTS)
keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", KEY_OPTS)
keymap("n", "gh", "<cmd>Lspsaga finder<CR>", { silent = true })
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })
keymap("n", "<a-cr>", "<cmd>Lspsaga code_action<CR>", { silent = true })

require "which-key".register({
    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = {
            "<cmd>FzfLua diagnostics_document<cr>",
            "Document Diagnostics",
        },
        w = {
            "<cmd>FzfLua diagnostics_workspace<cr>",
            "Workspace Diagnostics",
        },
        f = { function()
            vim.lsp.buf.format { async = true }
        end, "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        j = {
            "<cmd>lua vim.diagnostic.open_float()<CR>",
            "Open float diagnostic window",
        },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        r = { "<cmd>LspRestart<cr>", "Restart server" },
        s = { "<cmd>FzfLua lsp_document_symbols<cr>", "Document Symbols" },
        S = {
            "<cmd>FzfLua lsp_live_workspace_symbols<cr>",
            "Workspace Symbols",
        },
        h = {
            function()
                local bufnr = vim.fn.bufnr()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end,
            'Toggle inlay hint'
        }
    },
}, WHICH_KEY_OPTS)
