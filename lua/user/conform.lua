require("conform").setup({
    formatters_by_ft = {
        html = { "prettier", "prettierd", "my_prettierd", },
        python = { "autopep8" },
        cmake = { "cmake_format" },
        json = { "json_prettierd" },
    },
    formatters = {
        my_prettierd = {
            -- This can be a string or a function that returns a string
            command = "prettierd",
            -- OPTIONAL - all fields below this are optional
            args = {
                "--stdin-filepath", "$FILENAME", "--config", -- Required by conform
                "--no-semi", "--single-quote", "--jsx-single-quote", "--use-tabs"
            },
            -- If the formatter supports range formatting, create the range arguments here
            range_args = function(ctx)
                return { "--line-start", ctx.range.start[1], "--line-end", ctx.range["end"][1] }
            end,
            -- Send file contents to stdin, read new contents from stdout (default true)
            -- When false, will create a temp file (will appear in "$FILENAME" args). The temp
            -- file is assumed to be modified in-place by the format command.
            stdin = true,
        },
        json_prettierd = {
            command = "prettierd",
            args = {
                "--stdin-filepath", "$FILENAME", "--config", -- Required by conform
                "--no-semi", "--single-quote", "--jsx-single-quote", "--use-tabs"
            },
            range_args = function(ctx)
                return { "--line-start", ctx.range.start[1], "--line-end", ctx.range["end"][1] }
            end,
            stdin = true,
        },
    },
})
