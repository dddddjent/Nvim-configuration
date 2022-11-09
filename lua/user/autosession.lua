local opts = {
    log_level = 'info',
    auto_session_enable_last_session = true,
    auto_session_root_dir = vim.fn.stdpath('data') .. "/.sessions/",
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = false,
    auto_session_suppress_dirs = nil,
    auto_session_use_git_branch = nil,
    -- the configs below are lua only
    bypass_session_save_file_types = nil,
    pre_save_cmds = { "tabdo NvimTreeClose" },
    post_restore_cmds = { "tabdo NvimTreeOpen" }
}

require('auto-session').setup(opts)
