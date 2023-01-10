return {
    settings = {
        ltex = {
            completionEnabled = true,
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
