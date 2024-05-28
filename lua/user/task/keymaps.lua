local keymap = vim.keymap.set
keymap("n", "<leader>n", "<Cmd>lua require'user.task'.trigger_ui()<CR>", KEY_OPTS)
keymap("n", "tp", "<Cmd>e .vscode/launch.json <bar> e .vscode/tasks.json <cr>", KEY_OPTS)
-- require "which-key".register({
--     r = {""}
-- })
