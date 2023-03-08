local servers = {
    "lua_ls",
    "cssls",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "cmake",
    "verible",
    "rust_analyzer",
    "lemminx",
    "ltex",
    "clangd",
    "jdtls",
}

local M = {}
M.setup = function()
    local settings = {
        ui = {
            border = "none",
            icons = {
                package_installed = "◍",
                package_pending = "◍",
                package_uninstalled = "◍",
            },
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4,
        pip = { upgrade_pip = true }
    }

    require("mason").setup(settings)
    require("mason-lspconfig").setup({
        ensure_installed = servers,
        -- automatic_installation = true,
    })
end

return M
