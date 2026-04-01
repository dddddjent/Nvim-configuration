local options = {
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 0,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "utf-8",                  -- the encoding written to a file
    hlsearch = true,                         -- highlight all matches on previous search pattern
    ignorecase = true,                       -- ignore case in search patterns
    pumheight = 10,                          -- pop up menu height
    showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = false,                        -- creates a swapfile
    termguicolors = true,                    -- set term gui colors (most terminals support this)
    timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                         -- enable persistent undo
    updatetime = 300,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                        -- convert tabs to spaces
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    tabstop = 4,                             -- insert 2 spaces for a tab
    cursorline = true,                       -- highlight the current line
    cursorlineopt = "number",
    number = true,                           -- set numbered lines
    relativenumber = true,                   -- set relative numbered lines
    numberwidth = 1,                         -- set number column width to 2 {default 4}

    signcolumn = "yes:1",                    -- always show the sign column, otherwise it would shift the text each time
    -- &nu is for alpha, it will unset number
    -- statuscolumn = "%s%=%{&nu?(v:lnum==line('.')?v:lnum:v:relnum):''} ",

    wrap = false,
    -- linebreak = true,                        -- companion to wrap, don't split words
    scrolloff = 8,                           -- minimal number of screen lines to keep above and below the cursor
    -- sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
    guifont = "MesloLGL Nerd Font Mono:h20", -- the font used in graphical neovim applications
    -- linespace = 4,
    sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Markdowm paste
vim.g.mdip_imgdir = '.pic'
-- vim.g.markdown_fenced_languages={'python','cpp'}

vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
