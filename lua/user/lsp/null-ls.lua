local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- Avoid null-ls useless warning
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end
    notify(msg, ...)
end

null_ls.setup({
    on_init = function(new_client, _)
        new_client.offset_encoding = 'utf-8'
    end,
    debug = false,
    sources = {
        -- Have to use conform to format html (<br> is not correct)
        -- See which key <leader>lf
        formatting.prettier.with(
            {
                extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote", "--use-tabs" },
                filetypes = {
                    "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less",
                    "yaml", "html", "markdown", "markdown.mdx", "graphql", "handlebars"
                }
            }),
        formatting.clang_format.with({
            -- extra_args = {
            --     "-style=webkit",
            -- }
        }),
        formatting.latexindent,
        formatting.cmake_format,
        formatting.buf,
        diagnostics.protolint,
        formatting.black,
        formatting.isort,
        diagnostics.mypy,
        diagnostics.flake8.with({
            -- Force the severity
            diagnostics_postprocess = function(diagnostic)
                diagnostic.severity = vim.diagnostic.severity.WARN
                if diagnostic.message:find("unused") then
                    diagnostic.severity = vim.diagnostic.severity.HINT
                end
            end,
        }),
    },
})
