local which_key = require "which-key"

local setup = {
    window = {
        border = "rounded",       -- none, single, double, shadow
        padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 3, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 75 }, -- min and max width of the columns
    },
}
which_key.setup(setup)

WHICH_KEY_OPTS = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}
