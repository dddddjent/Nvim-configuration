local servers = {
    "lua_ls",
    "cssls",
    "pyright",
    -- "pylance",
    "ruff_lsp",
    "bashls",
    "jsonls",
    "yamlls",
    "cmake",
    "verible",
    -- "rust_analyzer",
    "lemminx",
    "ltex",
    "clangd",
    "jdtls",
    "marksman",
    "bufls",
    "zls",
    "texlab",
    "svlangserver",
    "eslint",
    "html",
    "tsserver",
    "taplo",
}

local M = {}
M.setup = function()
    local settings = {
        ui = {
            border = "none",
            icons = {
                package_installed = "I",
                package_pending = "P",
                package_uninstalled = "U",
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

    -- Install servers other than lsps
    local registry = require("mason-registry")
    for _, pkg_name in ipairs {
        "isort",
        -- "mypy",
        "codelldb",
        "clang-format",
        "cmakelint",
        "cmakelang",
        "debugpy",
        "prettier",
        "prettierd",
        "latexindent",
        "buf",
        "protolint",
        "markdown-toc"
    } do
        local ok, pkg = pcall(registry.get_package, pkg_name)
        if ok then
            if not pkg:is_installed() then
                pkg:install()
            end
        end
    end
end

return M
