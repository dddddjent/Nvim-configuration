local M = {}

M.setup = function()
    -- Avoid null-ls useless warnings
    local notify = vim.notify
    vim.notify = function(msg, ...)
        if msg:match("warning: multiple different client offset_encodings") then
            return
        end
        notify(msg, ...)
    end

    local null_ls = require "null-ls"
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    null_ls.setup({
        debug = false,
        sources = {
            formatting.prettierd.with(
                {
                    extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote", "--use-tabs" },
                    filetypes = {
                        "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less",
                        "yaml", "html", "markdown", "markdown.mdx", "graphql", "handlebars"
                    }
                }),
            formatting.clang_format,
            formatting.latexindent,
            formatting.markdown_toc,
            formatting.buf,
            formatting.isort,
            -- diagnostics.mypy,
            diagnostics.protolint,
        },
    })
end

return M
