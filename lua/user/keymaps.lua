local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

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

-- Center horizontally
keymap("n", "z.", "zszH", opts)

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

----------------------------------------------------
-- My mappings
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("n", "Q", "<nop>", opts)

-- Comment
keymap("n", "<C-_>", "<Plug>(comment_toggle_linewise_current) ", opts)
keymap("i", "<C-_>", "<esc><Plug>(comment_toggle_linewise_current) i", opts)
keymap("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", opts)
keymap("n", "<C-/>", "<Plug>(comment_toggle_linewise_current) ", opts)
keymap("i", "<C-/>", "<esc><Plug>(comment_toggle_linewise_current) i", opts)
keymap("v", "<C-/>", "<Plug>(comment_toggle_linewise_visual)", opts)

-- For debug
keymap({ "n", "i" }, "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
keymap({ "n", "i" }, "<F6>", "<Cmd>lua require'dap'.terminate()<CR>", opts)
keymap({ "n", "i" }, "<F9>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
keymap({ "n", "i" }, "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "J", "<Cmd>lua require('dapui').eval()<CR>", opts)

-- Script
local script_name = (function()
    if OS == "windows" then return 'script.ps1'
    else return 'script.sh'
    end
end)()
keymap({ "n", "i" }, "<F1>", function()
    local cmd = "./.vscode/" .. script_name .. ' f' .. 1
    vim.cmd("ToggleTerm direction=float")
    vim.cmd("TermExec cmd=" .. "'" .. cmd .. "'")
end)
keymap({ "n", "i" }, "<F2>", function()
    local cmd = "./.vscode/" .. script_name .. ' f' .. 2
    vim.cmd("ToggleTerm direction=float")
    vim.cmd("TermExec cmd=" .. "'" .. cmd .. "'")
end)
keymap({ "n", "i" }, "<F3>", function()
    local cmd = "./.vscode/" .. script_name .. ' f' .. 3
    vim.cmd("ToggleTerm direction=float")
    vim.cmd("TermExec cmd=" .. "'" .. cmd .. "'")
end)
keymap({ "n", "i" }, "<F4>", function()
    local cmd = "./.vscode/" .. script_name .. ' f' .. 4
    vim.cmd("ToggleTerm direction=float")
    vim.cmd("TermExec cmd=" .. "'" .. cmd .. "'")
end)
keymap({ "n", "i" }, "<F12>", function()
    local param = vim.fn.input('Param: ')
    local cmd = "./.vscode/" .. script_name .. ' ' .. param
    vim.cmd("ToggleTerm direction=float")
    vim.cmd("TermExec cmd=" .. "'" .. cmd .. "'")
end, opts)

-- Foldings
keymap('n', 'zR', require('ufo').openAllFolds, opts)
keymap('n', 'zM', require('ufo').closeAllFolds, opts)
keymap('n', 'K', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        -- choose one of coc.nvim and nvim lsp
        vim.lsp.buf.hover()
    end
end)

-- Telescope
keymap("n", "tt", "<Cmd>Telescope<CR>", opts)
keymap("n", "th", ":Telescope command_history <CR>", opts)
keymap("n", "tl", ":Telescope live_grep<CR>", opts)
keymap("n", "td", ":Telescope diagnostics<CR>", opts)

-- Replace
keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>x", "<cmd>!chmod +x '%'<CR>", { silent = true })

-- Split
keymap("n", '|', "<cmd>vsplit<cr>", opts)
keymap("n", '-', "<cmd>split<cr>", opts)
keymap("n", '<c-,>', "ighp_bEMN16BGOrLG0o3aJ4ARBK2kPxW5mn4WXBv", opts)

-- Tasks
keymap("n", "<C-p>", "<Cmd>lua require'user.task'.trigger_ui()<CR>", opts)
