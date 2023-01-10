return {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
            },
        },
    },
    cmd = (function()
        if OS == "windows" then
            return {
                'pyright'
            }
        else
            return nil
        end
    end)()
}
