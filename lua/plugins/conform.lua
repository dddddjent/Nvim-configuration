return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            python = { "autopep8" },
            javascript = { "prettierd" },
            javascriptreact = { "prettierd" },
            typescript = { "prettierd" },
            typescriptreact = { "prettierd" },
            vue = { "prettierd" },
            html = { "prettierd" },
            css = { "prettierd" },
            scss = { "prettierd" },
            less = { "prettierd" },
            yaml = { "prettierd" },
            bash = { "shfmt" },
            sh = { "shfmt" },
            cmake = { "cmake_format" },
        },
        formatters = {
            autopep8 = {
                command = PYTHON_DEP_DIR .. "/autopep8",
            },
            prettierd = {
                append_args = { "--no-semi", "--single-quote", "--jsx-single-quote", "--use-tabs" },
                command = NODE_DEP_DIR .. "/prettierd",
            },
            shfmt = {
                command = MISE_DEP_DIR .. "/shfmt",
            },
            cmake_format = {
                command = PYTHON_DEP_DIR .. "/cmake-format",
            },
        },
        -- Set this to change the default values when calling conform.format()
        -- This will also affect the default values for format_on_save/format_after_save
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
}
