local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local extras = require "luasnip.extras"
local fmt = extras.fmt
local m = extras.m
local l = extras.l
local postfix = require "luasnip.extras.postfix".postfix

ls.add_snippets("markdown", {
    -- Code blocks
    ls.parser.parse_snippet(
        "cppcode",
        "```cpp\n$1\n```"
    ),

    -- Enter
    s("enter", {
        t("<br/>"),
    }),

    -- Space (half space)
    s("space", {
        t("&ensp;"),
    }),
    s("space4", {
        t("&ensp;&ensp;&ensp;&ensp;")
    }),

    -- Font
    s("font", {
        t({ "<font face=\"Consolas\" size=4 color=(220, 20, 60)>", "" }),
        t({ "Consolas,2,(220, 20, 60): ", "" }),
        t("    "), i(1),
        t({ "", "</font>", "" }),
        t("")
    }),

    -- Latex
    s("latex", {
        t({ "$$", "" }),
        i(1),
        t({ "", "$$" })
    }),
})
