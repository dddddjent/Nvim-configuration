require("conform").setup({
    formatters_by_ft = {
        python = {
            (WORKSPACE_JSON["python-formatter"] == "autopep8" and "autopep8" or nil),
        },
    },
})
