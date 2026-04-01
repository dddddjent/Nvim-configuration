return {
    'smoka7/hop.nvim',
    version = "*",
    opts = {
        keys = 'ahklyuiopnmqwertzxcvbsdgjf',
        multi_windows = false
    },
    keys = {
        {
            "f",
            function()
                require('hop').hint_char1({})
            end,
            desc = "Hop",
            mode = "n"
        }
    }
}
