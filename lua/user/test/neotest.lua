-- Vim-test
-- exe in build/test, the cpp file is in the current_work_dir/test
local cmd = vim.cmd
cmd "let g:test#cpp#catch2#relToProject_build_dir = 'build'"
cmd "let g:test#cpp#catch2#bin_dir = '../build/test' "
cmd "let g:test#cpp#catch2#make_command = 'ninja;ninja test'"

require("neotest").setup({
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
        }),
        require("neotest-vim-test")({
            ignore_file_types = { "python", "vim", "lua" },
        }),
        require("neotest-rust"),
    },
})
