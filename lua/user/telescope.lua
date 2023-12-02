local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"
local sorters = require "telescope.sorters"

local rg_cmd = vim.fn.stdpath('config') .. '/bin/rg'
if OS == 'windows' then
    rg_cmd = vim.fn.stdpath('config') .. '/bin/rg.exe'
end

telescope.setup {
    defaults = {
        path_display = { "full" },
        vimgrep_arguments = {
            rg_cmd,
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden=true",
            "--glob=!.git/",
        },
    },
    pickers = {
        find_files = {
            find_command = {
                rg_cmd, "--files", "--hidden",
                "--follow",
                "-g", "!**/.git/**",
                "-g", "!**/.idea/**",
                "-g", "!**/.cache/**",
                "-g", "!**/.gitlab/**",
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },                                  -- please take a look at the readme of the extension you want to configure
    },
    file_sorter = sorters.get_fuzzy_file,
    generic_sorter = sorters.get_generic_fuzzy_sorter,
}
require("telescope").load_extension "fzf"
require('telescope').load_extension "dap"

local keymap = vim.keymap.set
keymap("n", "tt", "<Cmd>Telescope<CR>", KEY_OPTS)
keymap("n", "th", ":Telescope command_history <CR>", KEY_OPTS)
keymap("n", "tl", ":Telescope live_grep<CR>", KEY_OPTS)
keymap("n", "td", ":Telescope diagnostics<CR>", KEY_OPTS)
keymap("n", "tb", ":Telescope buffers<CR>", KEY_OPTS)

require "which-key".register({
    ["f"] = {
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Find files",
    },
}, WHICH_KEY_OPTS)
