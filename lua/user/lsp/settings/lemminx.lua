return {
    cmd = (function()
        if OS == "windows" then
            return {
                'lemminx'
            }
        else
            return nil
        end
    end)()
}
