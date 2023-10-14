local rg_cmd = vim.fn.stdpath('config') .. '/bin/rg'
if OS == 'windows' then
    rg_cmd = vim.fn.stdpath('config') .. '/bin/rg.exe'
end

-- local function file_exists(path)
--     local file = io.open(path, "rb")
--     if file then file:close() end
--     return file ~= nil
-- end

-- local spectre_path = vim.fn.stdpath("data") .. "/lazy/nvim-spectre/"
-- if file_exists(spectre_path .. 'lua/spectre_oxi.so') == false then
--     print("Compiling nvim-oxi for nvim-spectre")
--
--     local cmd = "cd " .. spectre_path .. ';./build.sh nvim-oxi'
--     os.execute(cmd)
--
--     print("Compilation done")
--     print()
--     print('PLEASE restart to use oxi')
-- end

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
    -- default = {
    --     replace = {
    --         cmd = "oxi"
    --     }
    -- }
})
