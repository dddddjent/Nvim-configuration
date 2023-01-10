return {
    cmd = (function()
        if OS == "windows" then
            return {
                'cmake-language-server.cmd'
            }
        else
            return nil
        end
    end)()
}
