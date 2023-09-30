local rg_cmd = vim.fn.stdpath('config') .. '/bin/rg'
if OS == 'windows' then
    rg_cmd = vim.fn.stdpath('config') .. '/bin/rg.exe'
end

require('spectre').setup({
    find_engine = {
        -- rg is map with finder_cmd
        ['rg'] = {
            cmd = rg_cmd,
            -- default args
            args = {
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                "--glob=!.git/",
            },
        },
    },
    find = {
        --pick one of item in find_engine
        cmd = rg_cmd,
        options = {
            "ignore-case"
        }
    },
    default = {
        replace = {
            cmd = "oxi"
        }
    }
})
