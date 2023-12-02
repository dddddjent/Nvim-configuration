return {
    lspconfig = {
        cmd = { 'svlangserver' },
        filetypes = { 'verilog', 'systemverilog' },
        single_file_support = true,
        settings = {
            systemverilog = {
                includeIndexing = { '*.{v,vh,sv,svh}', '**/*.{v,vh,sv,svh}' },
                formatCommand   = "verible-verilog-format" ..
                    " --indentation_spaces" .. " 4" ..
                    " --formal_parameters_indentation" .. " indent" ..
                    " --assignment_statement_alignment=align" ..
                    " --named_port_alignment=align" ..
                    " --port_declarations_alignment=align" ..
                    " --module_net_variable_alignment=align",
            },
        },
    }
}
