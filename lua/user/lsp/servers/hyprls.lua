return {
    lspconfig = {
        cmd = { "hyprls", "--stdio" },
        filetypes = { "*.hl", "hypr*.conf", ".config/hypr/*.conf", "hyprlang" },
        single_file_support = true
    }
}
