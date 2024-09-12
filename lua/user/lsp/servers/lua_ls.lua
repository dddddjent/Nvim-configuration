local util = require 'lspconfig.util'

local root_files = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
}

return {
    lspconfig = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
                completion = {
                    callSnippet = "Replace"
                },
                hint = {
                    enable = true,
                },
            },
        },
        root_dir = function(fname)
            print('1')
            ---@diagnostic disable-next-line: deprecated
            local root = util.root_pattern(unpack(root_files))(fname)
            if root and root ~= vim.env.HOME then
                return root
            end
            root = util.root_pattern 'lua/' (fname)
            if root then
                return root
            end
            return util.find_git_ancestor(fname)
        end,
    },
    is_format_disabled = false,
}
