local ls = require "luasnip"

require("luasnip/loaders/from_vscode").lazy_load()

ls.config.set_config {
    history = true,
    -- Change as typing
    updateevents = "TextChanged,TextChangedI",
    -- Auto snippets
    enable_autosnippets = true,

}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
keymap("i", '<a-j>', function()
    if ls.expandable() then
        ls.expand()
    elseif ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, opts)
keymap("i", "<a-k>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, opts)

require('user.snippets.lua-snippets')
require('user.snippets.markdown')
require('user.snippets.cpp')
