return {
    settings = {
        ltex = {
            enabled = { "latex", "tex", "bib", "md" },
            diagnosticSeverity = "information",
        }
    },
    cmd = (function()
        if OS == "windows" then
            return {
                'ltex-ls'
            }
        else
            return nil
        end
    end)()
}
