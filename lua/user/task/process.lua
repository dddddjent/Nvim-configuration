local M = {}

M.process = function(config)
    local cmd = config.command
    if config.args ~= nil then
        for key, value in pairs(config.args) do
            cmd = cmd .. " " .. value
        end
    end

    -- CWD
    local dir = ""
    if config.options ~= nil then
        if config.options.cwd ~= nil then
            dir = config.options.cwd
        end
    end
    cmd = "cd " .. dir .. ";" .. cmd
    cmd = cmd .. ";cd " .. vim.fn.getcwd()

    -- EXECUTE
    vim.cmd("ToggleTerm direction=float")
    -- TermExec cmd='cmd' dir=dir
    vim.cmd("TermExec cmd=" .. "'" .. cmd .. "'" .. " dir=" .. dir)
end

return M
