return {
    cmd = { "slangd" },
    filetypes = { "hlsl", "shaderslang" },
    root_markers = { "slangdconfig.json", ".git" },
    settings = {},

    before_init = function(_, config)
        local file = vim.fs.find("slangdconfig.json", {
            path = config.root_dir,
            upward = true,
        })[1]
        if not file then
            return
        end

        local data = vim.json.decode(
            table.concat(vim.fn.readfile(file), "\n")
        )
        local dir = vim.fs.dirname(file)

        -- Resolve paths relative to slangdconfig.json.
        for i, path in ipairs(data["slang.additionalSearchPaths"] or {}) do
            if path:sub(1, 1) ~= "/" then
                data["slang.additionalSearchPaths"][i] =
                    vim.fs.normalize(dir .. "/" .. path)
            end
        end

        -- Convert dotted JSON keys into nested Neovim settings.
        for key in pairs(config.settings) do
            config.settings[key] = nil
        end
        for key, value in pairs(data) do
            local keys = vim.split(key, ".", { plain = true })
            local target = config.settings
            for i = 1, #keys - 1 do
                target[keys[i]] = target[keys[i]] or {}
                target = target[keys[i]]
            end
            target[keys[#keys]] = value
        end
    end,
}

