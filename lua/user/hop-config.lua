local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('n', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR,true })
end, {remap=true})
vim.keymap.set('n', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR,})
end, {remap=true})
