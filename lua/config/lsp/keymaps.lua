local keymap = vim.keymap.set
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", KEY_OPTS)
-- keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", KEY_OPTS)
keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", KEY_OPTS)
keymap("n", "gh", "<cmd>Lspsaga finder<CR>", { silent = true })
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })
keymap("n", "<a-cr>", "<cmd>Lspsaga code_action<CR>", { silent = true })

require "which-key".add({
    mode = {"n"},
    group = "LSP",
    {
        {"<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
        {"<leader>ld",
            "<cmd>FzfLua diagnostics_document<cr>",
            desc = "Document Diagnostics",
        },
        {"<leader>lw",
            "<cmd>FzfLua diagnostics_workspace<cr>",
            desc= "Workspace Diagnostics",
        },
        {"<leader>lf",  function()
            vim.lsp.buf.format { async = true }
        end, desc = "Format" },
        {"<leader>li", "<cmd>checkhealth vim.lsp<cr>", desc = "Info" },
        {"<leader>lj",
            "<cmd>lua vim.diagnostic.open_float()<CR>",
            desc = "Open float diagnostic window",
        },
        { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
        { "<leader>lr", "<cmd>lsp restart<cr>", desc = "Restart server" },
        {"<leader>ls",  "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Document Symbols" },
        {"<leader>lS",
            "<cmd>FzfLua lsp_live_workspace_symbols<cr>",
            desc = "Workspace Symbols",
        },
        { "<leader>lh",
            function()
                local bufnr = vim.fn.bufnr()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end,
            desc= 'Toggle inlay hint'
        }
    },
})

