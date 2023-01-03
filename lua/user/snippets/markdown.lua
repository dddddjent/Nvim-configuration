local ls = require "luasnip"
ls.add_snippets("markdown", {
    ls.parser.parse_snippet(
        "cppcode",
        "```cpp\n$1\n```"
    ),
})
