return {
    extra_args = { "--indentation_spaces", "4",
        "--formal_parameters_indentation", "indent",
        "--assignment_statement_alignment=align",
        "--named_port_alignment=align",
        "--port_declarations_alignment=align",
        "--module_net_variable_alignment=align"
    },
    cmd = {
        'verible-verilog-ls' .. (function() if vim.fn.has('win32') then return '.cmd' end end)()
    }
}
