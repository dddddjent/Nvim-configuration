local ls = require "luasnip"
local types = require "luasnip.util.types"

require("luasnip/loaders/from_vscode").lazy_load()

ls.config.set_config {
    history = true,
    -- Change as typing
    updateevents = "TextChanged,TextChangedI",
    -- Auto snippets
    enable_autosnippets = true,

}

vim.keymap.set("i", "<c-l>", function()
    if ls.choice_active then
        ls.change_choice(1)
    end
end)

vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

ls.add_snippets("lua", {
    ls.parser.parse_snippet(
        "lf",
        "local $1 = function($3)\n\t$0\nend"
    ),
})
