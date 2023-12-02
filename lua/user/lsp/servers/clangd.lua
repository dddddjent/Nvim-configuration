return {
    lspconfig = {
        cmd = {
            'clangd',
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
    },
    is_format_disabled = true,
}
