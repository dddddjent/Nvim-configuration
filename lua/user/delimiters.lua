local rainbow = require 'rainbow-delimiters'

require 'rainbow-delimiters.setup' {
    strategy = {
        [''] = rainbow.strategy['global'],
        -- html = rainbow.strategy['local'],
        latex = function()
            -- Disabled for very large files, global strategy for large files,
            -- local strategy otherwise
            if vim.fn.line('$') > 10000 then
                return nil
            elseif vim.fn.line('$') > 1000 then
                return rainbow.strategy['global']
            end
            return rainbow.strategy['local']
        end
    },
    blacklist = { "html" }
}
