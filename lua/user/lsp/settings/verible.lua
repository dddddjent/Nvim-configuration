return {
    extra_args = { "--indentation_spaces", "4",
        "--formal_parameters_indentation", "indent",
        "--assignment_statement_alignment=align",
        "--named_port_alignment=align",
        "--port_declarations_alignment=align",
        "--module_net_variable_alignment=align"
    },
    cmd = (function()
        if OS == "windows" then
            return {
                'verible-verilog-ls'
            }
        else
            return nil
        end
    end)()
}
