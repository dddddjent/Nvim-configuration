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
---@diagnostic disable-next-line: deprecated
    root_dir = util.root_pattern(unpack(root_files)), -- We may use unpack for now (table.unpack() is not working)
}
