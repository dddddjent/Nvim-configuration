local root_dir = vim.fn.expand("~") .. "/.local/share/nvim/.sessions"
vim.fn.mkdir(root_dir, "p")

return {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
        log_level = 'error',
        -- auto_session_enable_last_session = true,
        root_dir = root_dir,
        enabled = true,
        auto_save = true,
        auto_restore = true,
        suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        auto_session_use_git_branch = nil,
        -- the configs below are lua only
        bypass_session_save_file_types = nil,
    },
    keys = {
        mode = "n",
        { "<leader>ss", "<cmd>Autosession save<cr>",    desc = "Session save" },
        { "<leader>sd", "<cmd>Autosession delete<cr>",  desc = "Session delete" },
        { "<leader>sr", "<cmd>Autosession restore<cr>", desc = "Session restore" },
    }
}
