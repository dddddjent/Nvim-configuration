local hop = require('hop')
hop.setup {
    keys = 'ahklyuiopnmqwertzxcvbsdgjf',
    multi_windows = false
}

vim.keymap.set('n', 'f', function()
    hop.hint_char1({})
end, { remap = true })
