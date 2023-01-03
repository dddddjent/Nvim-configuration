local ls = require "luasnip"

require("luasnip/loaders/from_vscode").lazy_load()

ls.config.set_config {
    history = true,
    -- Change as typing
    updateevents = "TextChanged,TextChangedI",
    -- Auto snippets
    enable_autosnippets = true,

}

require('user.snippets.lua-snippets')
require('user.snippets.cpp')
require('user.snippets.markdown')
