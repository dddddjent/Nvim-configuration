require("nvim-dap-virtual-text").setup {
    highlight_new_as_changed = true, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    only_first_definition = false,   -- only show virtual text at first definition (if there are multiple)
    virt_text_pos = 'eol',           -- position of virtual text, see `:h nvim_buf_set_extmark()`
}
