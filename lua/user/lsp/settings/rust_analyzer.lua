return {
    imports = {
        granularity = {
            group = "module",
        },
        prefix = "self",
    },
    cargo = {
        buildScripts = {
            enable = true,
        },
    },
    procMacro = {
        enable = true
    },
    cmd = (function()
        if OS == "windows" then
            return {
                'rust-analyzer'
            }
        else
            return nil
        end
    end)()
}
