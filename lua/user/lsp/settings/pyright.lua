local util = require 'lspconfig.util'
local root_files = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
}
return {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
            },
        },
    },
    root_dir = util.root_pattern(table.unpack(root_files)),
    cmd = (function()
        if OS == "windows" then
            return {
                'pyright'
            }
        else
            return nil
        end
    end)()
}
