require('auto-session').setup(
    {
        log_level = 'error',
        -- auto_session_enable_last_session = true,
        root_dir = vim.fn.stdpath('data') .. "/.sessions/",
        enabled = true,
        auto_save = true,
        auto_restore = true,
        suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        auto_session_use_git_branch = nil,
        -- the configs below are lua only
        bypass_session_save_file_types = nil,
        pre_save_cmds = { "tabdo NvimTreeClose",
            function()
                if OS == 'windows' then
                    local cwd = vim.fn.getcwd()
                    local nvim_data_folder = 'C:\\Users\\13060\\AppData\\Local\\nvim-data\\.sessions\\'
                    cwd = string.gsub(cwd, ':', '++')
                    cwd = string.gsub(cwd, '/', '\\\\') -- Have to use this on Windows when using os to mkdir (recursive folders)
                    os.execute('mkdir ' .. nvim_data_folder .. cwd)
                end
            end
        },
        -- post_restore_cmds = { "tabdo NvimTreeOpen" }
    })
