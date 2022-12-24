local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- My mappings
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-l>", "<Right>", opts)
vim.keymap.set("n", "<C-_>", "<Plug>(comment_toggle_linewise_current) ", opts)
vim.keymap.set("i", "<C-_>", "<esc><Plug>(comment_toggle_linewise_current) i", opts)
vim.keymap.set("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", opts)
vim.keymap.set("n", "<C-/>", "<Plug>(comment_toggle_linewise_current) ", opts)
vim.keymap.set("i", "<C-/>", "<esc><Plug>(comment_toggle_linewise_current) i", opts)
vim.keymap.set("v", "<C-/>", "<Plug>(comment_toggle_linewise_visual)", opts)

-- For debug
vim.keymap.set("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
vim.keymap.set("n", "<F6>", "<Cmd>lua require'dap'.terminate()<CR>", opts)
vim.keymap.set("n", "<F9>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
vim.keymap.set("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F1>", "<Cmd>!./.nvim/script.sh f1 exit<CR>", opts)
keymap("n", "<F2>", "<Cmd>!./.nvim/script.sh f2 exit<CR>", opts)
keymap("n", "<F3>", "<Cmd>!./.nvim/script.sh f3 exit<CR>", opts)
keymap("n", "<F4>", "<Cmd>!./.nvim/script.sh f4 exit<CR>", opts)
vim.keymap.set("i", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
vim.keymap.set("i", "<F6>", "<Cmd>lua require'dap'.terminate()<CR>", opts)
vim.keymap.set("i", "<F9>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
vim.keymap.set("i", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
keymap("i", "<F1>", "<Cmd>!./.nvim/script.sh f1 exit<CR>", opts)
keymap("i", "<F2>", "<Cmd>!./.nvim/script.sh f2 exit<CR>", opts)
keymap("i", "<F3>", "<Cmd>!./.nvim/script.sh f3 exit<CR>", opts)
keymap("i", "<F4>", "<Cmd>!./.nvim/script.sh f4 exit<CR>", opts)

-- Foldings
vim.keymap.set('n', 'zR', require('ufo').openAllFolds,opts)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds,opts)

-- Telescope
keymap("n","<C-t>","<Cmd>Telescope<CR>",opts)
