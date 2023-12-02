local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup {
  pre_hook = function(ctx)
    local U = require "Comment.utils"

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

    return internals.calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
}

local keymap = vim.keymap.set
keymap("n", "<C-_>", "<Plug>(comment_toggle_linewise_current) ", KEY_OPTS)
keymap("i", "<C-_>", "<esc><Plug>(comment_toggle_linewise_current) i", KEY_OPTS)
keymap("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", KEY_OPTS)
keymap("n", "<C-/>", "<Plug>(comment_toggle_linewise_current) ", KEY_OPTS)
keymap("i", "<C-/>", "<esc><Plug>(comment_toggle_linewise_current) i", KEY_OPTS)
keymap("v", "<C-/>", "<Plug>(comment_toggle_linewise_visual)", KEY_OPTS)
