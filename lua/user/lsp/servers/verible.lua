return {
    lspconfig = {
        cmd =
        {
            'verible-verilog-ls',
            '--rules',
            '-no-tabs',
            '-posix-eof'
        }
    },
    is_format_disabled = true,
}
