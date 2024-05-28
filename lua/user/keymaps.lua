KEY_OPTS = { noremap = true, silent = true }
local keymap = vim.keymap.set
local term_opts = { silent = true }

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("", "<Space>", "<Nop>", KEY_OPTS)

-- Normal --
keymap("n", "<C-h>", "<C-w>h", KEY_OPTS)
keymap("n", "<C-j>", "<C-w>j", KEY_OPTS)
keymap("n", "<C-k>", "<C-w>k", KEY_OPTS)
keymap("n", "<C-l>", "<C-w>l", KEY_OPTS)
keymap("n", "<C-Up>", ":resize -2<CR>", KEY_OPTS)
keymap("n", "<C-Down>", ":resize +2<CR>", KEY_OPTS)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", KEY_OPTS)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", KEY_OPTS)
keymap("n", "<S-l>", ":bnext<CR>", KEY_OPTS)
keymap("n", "<S-h>", ":bprevious<CR>", KEY_OPTS)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", KEY_OPTS)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", KEY_OPTS)
-- Center horizontally
keymap("n", "z.", "zszH", KEY_OPTS)

-- Visual --
keymap("v", "<", "<gv", KEY_OPTS)
keymap("v", ">", ">gv", KEY_OPTS)
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", KEY_OPTS)
keymap("v", "<A-k>", ":m .-2<CR>==", KEY_OPTS)
keymap("v", "p", '"_dP', KEY_OPTS)

-- Visual Block --
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", KEY_OPTS)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", KEY_OPTS)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

----------------------------------------------------
-- My mappings
keymap("i", "<C-h>", "<Left>", KEY_OPTS)
keymap("i", "<C-j>", "<Down>", KEY_OPTS)
keymap("i", "<C-k>", "<Up>", KEY_OPTS)
keymap("i", "<C-l>", "<Right>", KEY_OPTS)
keymap("n", "Q", "<nop>", KEY_OPTS)

-- Replace
-- keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>x", "<cmd>!chmod +x '%'<CR>", { silent = true })

-- Split
keymap("n", '|', "<cmd>vsplit<cr>", KEY_OPTS)
keymap("n", '-', "<cmd>split<cr>", KEY_OPTS)

require "which-key".register({
    ["w"] = { "<cmd>w!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },
    ["4"] = { "<cmd>qa!<CR>", "Quit All" },
    ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },

    p = {
        name = "Lazy/Projects/Paste",
        C = { function()
            if OS == "windows" then
                vim.cmd "!cp -Recurse -Force C:\\Users\\13060\\AppData\\Local\\nvim\\.vscode ."
            else
                vim.cmd "!cp -rf /home/ljl/.config/nvim/.vscode ."
            end
        end, "Setup config" },
        p = { "<cmd>call mdip#MarkdownClipboardImage()<cr>", "Paste an image in markdown" },
    },

    g = {
        name = "Git",
        g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    },

    -- Markdown
    m = {
        name = "Markdown preview",
        s = { "<Plug>MarkdownPreview", "Preview start" },
        p = { "<Plug>MarkdownPreviewStop", "Preview stop" },
        t = { "<Plug>MarkdownPreviewToggle", "Preview toggle" },
    },

    -- Undotree
    u = { "<cmd>UndotreeToggle<cr>", "Toggle UndoTree" },

    H = { function()
        local file_name = vim.fn.expand("%")
        local cmd = "nohup firefox " .. file_name .. " &"
        local job = vim.fn.jobstart(cmd)
    end, "HTML preview" },

    ["9"] = { "1gt", "To tab 1" },
    ["0"] = { "2gt", "To tab 2" }
}, WHICH_KEY_OPTS)
