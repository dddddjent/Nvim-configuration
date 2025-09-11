require("codecompanion").setup({
    strategies = {
        chat = {
            name = "copilot",
            model = "gpt-5-mini",
        },
        inline = {
            adapter = "copilot",
            model = "gpt-5-mini",
        },
    },
})
