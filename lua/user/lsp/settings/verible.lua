return {
    cmd = (function()
        if OS == "windows" then
            return {
                'verible-verilog-ls'
            }
        else
            return { 'verible-verilog-ls',
                '--rules',
                '-no-tabs',
                '-posix-eof' }
            -- return nil
        end
    end)()
}
