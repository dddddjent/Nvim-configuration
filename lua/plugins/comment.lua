return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {
        pre_hook = function(ctx)
            local U = require"Comment.utils"

            local status_utils_ok, utils = pcall(require, "ts_context_commentstring.utils")
            if not status_utils_ok then
                return
            end

            local location = nil
            if ctx.ctype == U.ctype.block then
                location = utils.get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = utils.get_visual_start_location()
            end

            local status_internals_ok, internals = pcall(require, "ts_context_commentstring.internals")
            if not status_internals_ok then
                return
            end

            return internals.calculate_commentstring{
                key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
                location = location,
            }
        end,
    },
    keys = {
        { "<C-_>", "<Plug>(comment_toggle_linewise_current) ",       mode = "n", desc = "Toggle comment" },
        { "<C-_>", "<esc><Plug>(comment_toggle_linewise_current) i", mode = "i", desc = "Toggle comment" },
        { "<C-_>", "<Plug>(comment_toggle_linewise_visual)",         mode = "v", desc = "Toggle comment" },
        { "<C-/>", "<Plug>(comment_toggle_linewise_current) ",       mode = "n", desc = "Toggle comment" },
        { "<C-/>", "<esc><Plug>(comment_toggle_linewise_current) i", mode = "i", desc = "Toggle comment" },
        { "<C-/>", "<Plug>(comment_toggle_linewise_visual)",         mode = "v", desc = "Toggle comment" },
    }
}
