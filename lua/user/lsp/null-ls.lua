local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    on_init = function(new_client, _)
        new_client.offset_encoding = 'utf-8'
    end,
    debug = false,
    sources = {
        formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote",
            "--use-tabs" } }),
        -- formatting.black.with({ extra_args = { "--fast" } }),
        -- formatting.stylua,
        --   -- diagnostics.flake8
        formatting.verible_verilog_format.with({
            filetypes = { "verilog", "systemverilog" },
            extra_args = {
                "--indentation_spaces", "4",
                "--formal_parameters_indentation", "indent",
                "--assignment_statement_alignment=align",
                "--named_port_alignment=align",
                "--port_declarations_alignment=align",
                "--module_net_variable_alignment=align"
            },
        }),
        formatting.clang_format.with({
            extra_args = {
                "-style=webkit",
            }
        }),
        formatting.autopep8,
        formatting.latexindent,
    },
})
