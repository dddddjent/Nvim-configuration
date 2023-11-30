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
local function file_exists(path)
    local file = io.open(path, "rb")
    if file then file:close() end
    return file ~= nil
end
local pylsp_path = vim.fn.expand("$HOME/Documents/applications/pylsp/pylsp")
local cmd = {}
if file_exists(pylsp_path) == true then
    cmd = {
        pylsp_path, "", "--stdio",
    }
else
    cmd = {
        "pyright-langserver", "--stdio",
    }
end

return {
    settings = {
        python = {
            analysis = {
                diagnosticMode = "openFilesOnly", -- Very Important
                typeCheckingMode = "off",         -- Set in separted projects
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                reportMissingTypeStubs = true,
                inlayHints = {
                    variableTypes = true,
                    functionReturnTypes = true,
                    callArgumentNames = true,
                },
                extraPaths = { vim.fn.getcwd() },
                stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs" -- Needs to be cloned yourself
            },
        },
        pyright = {
            disableLanguageServices = false,
            disableOrganizeImports = false
        },
    },
    cmd = cmd,
    ---@diagnostic disable-next-line: deprecated
    root_dir = util.root_pattern(unpack(root_files)), -- We may use unpack for now (table.unpack() is not working)
}
