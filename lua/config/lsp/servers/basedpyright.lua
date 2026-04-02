return {
    cmd = { NODE_DEP_DIR .. "/basedpyright-langserver", "--stdio" },
    settings = {
        basedpyright = {
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
                -- stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs" -- Needs to be cloned yourself
            },
        },
    },
    root_markers = {
        'pyrightconfig.json',
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        '.git',
    },
    format = false,
}
