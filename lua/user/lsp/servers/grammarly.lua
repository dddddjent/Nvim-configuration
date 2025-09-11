return {
    lspconfig = {
        filetypes = { "markdown", "text", "tex" },
        init_options = {
            clientId = 'client_BaDkMgx4X19X9UxxYRCXZo',
            -- clientId = 'client_',
        },
        -- root_dir = util.root_pattern(unpack(root_files)), -- We may use unpack for now (table.unpack() is not working)
    },
    is_format_disabled = true,
}
