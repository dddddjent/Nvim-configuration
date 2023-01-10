local util = require 'lspconfig.util'

-- https://clangd.llvm.org/extensions.html#switch-between-sourceheader
local function switch_source_header(bufnr)
    bufnr = util.validate_bufnr(bufnr)
    local clangd_client = util.get_active_client_by_name(bufnr, 'clangd')
    local params = { uri = vim.uri_from_bufnr(bufnr) }
    if clangd_client then
        clangd_client.request('textDocument/switchSourceHeader', params, function(err, result)
            if err then
                error(tostring(err))
            end
            if not result then
                print 'Corresponding file cannot be determined'
                return
            end
            vim.api.nvim_command('edit ' .. vim.uri_to_fname(result))
        end, bufnr)
    else
        print 'method textDocument/switchSourceHeader is not supported by any servers active on the current buffer'
    end
end

local root_files = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac', -- AutoTools
}

local default_capabilities = {
    textDocument = {
        completion = {
            editsNearCursor = true,
        },
    },
    offsetEncoding = { 'utf-8', 'utf-16' },
}

local clang_cmd = (function()
    if OS == "windows" then
        return {
            'clangd.cmd'
        }
    else
        return 'clangd'
    end
end)()

require("clangd_extensions").setup {
    server = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
        default_config = {
            cmd = { clang_cmd,
                '--background-index',
                '--cross-file-rename',
                '--header-insertion=never',
                '--clang-tidy',
                '-j=8',
                '--inlay-hints',
                '--suggest-missing-includes',
                '--header-insertion-decorators',
                '--all-scopes-completion',
                '--pch-storage=memory',
            },
            filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
            root_dir = function(fname)
                return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
            end,
            single_file_support = true,
            capabilities = default_capabilities,
        },
        commands = {
            ClangdSwitchSourceHeader = {
                function()
                    switch_source_header(0)
                end,
                description = 'Switch between source/header',
            },
        },
    },
    extensions = {
        -- defaults:
        -- Automatically set inlay hints (type hints)
        autoSetHints = true,
        -- These apply to the default ClangdSetInlayHints command
        inlay_hints = {
            -- Only show inlay hints for the current line
            only_current_line = false,
            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",
            -- whether to show parameter hints with the inlay hints or not
            show_parameter_hints = true,
            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",
            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",
            -- whether to align to the length of the longest line in the file
            max_len_align = false,
            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,
            -- whether to align to the extreme right or not
            right_align = false,
            -- padding from the right if right_align is true
            right_align_padding = 7,
            -- The color of the hints
            highlight = "Comment",
            -- The highlight group priority for extmark
            priority = 100,
        },
        ast = {
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },

            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            },

            highlights = {
                detail = "Comment",
            },
        },
        memory_usage = {
            border = "none",
        },
        symbol_info = {
            border = "none",
        },
    },
}
