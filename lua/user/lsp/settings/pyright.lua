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
                diagnosticMode = "openFilesOnly", -- Very Important
                typeCheckingMode = "off",         -- Set in separted projects
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                reportMissingTypeStubs = true,
                stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs" -- Needs to be cloned yourself
            },
        },
        pyright = {
            disableLanguageServices = false,
            disableOrganizeImports = false
        },
    },
    ---@diagnostic disable-next-line: deprecated
    root_dir = util.root_pattern(unpack(root_files)), -- We may use unpack for now (table.unpack() is not working)
}
