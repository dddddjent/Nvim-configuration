local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
require("lazy").setup({
    { "nvim-lua/plenary.nvim" },
    { "windwp/nvim-autopairs" },
    { "numToStr/Comment.nvim" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "kyazdani42/nvim-web-devicons", },
    { "kyazdani42/nvim-tree.lua", },
    { "akinsho/bufferline.nvim", },
    { "moll/vim-bbye", },
    { "nvim-lualine/lualine.nvim", },
    { "akinsho/toggleterm.nvim", },
    { "ahmedkhalf/project.nvim", },
    -- use { "lewis6991/impatient.nvim", } -- substituted by vim.loader.enable()
    {
        "lukas-reineke/indent-blankline.nvim",
        branch = "master",
        commit = "b7aa0aed55887edfaece23f7b46ab22232fc8741",
    },
    { "goolord/alpha-nvim" },
    { "folke/which-key.nvim" },
    { "HiPhish/rainbow-delimiters.nvim" },
    { "ThePrimeagen/harpoon" },

    -- Colorschemes
    { "lunarvim/darkplus.nvim" },
    { "catppuccin/nvim" },
    { 'folke/tokyonight.nvim' },
    { 'luisiacc/gruvbox-baby' },
    { "ellisonleao/gruvbox.nvim" },
    { "olimorris/onedarkpro.nvim" },

    -- Cmp
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-omni" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },

    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "RRethy/vim-illuminate" },
    ({
        "glepnir/lspsaga.nvim",
        branch = "main",
        commit = "b7b4777369b441341b2dcd45c738ea4167c11c9e",
    }),
    { "ray-x/lsp_signature.nvim", },
    { "p00f/clangd_extensions.nvim" },
    { "mfussenegger/nvim-jdtls" },
    { "ap/vim-css-color" },
    { "simrat39/rust-tools.nvim" },

    -- Telescope
    { "nvim-telescope/telescope.nvim" },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", },
    { 'nvim-treesitter/playground', dependencies = 'nvim-treesitter' },
    { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },

    -- Git
    { "lewis6991/gitsigns.nvim" },
    { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },

    -- Dap
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text" },
    { "nvim-telescope/telescope-dap.nvim" },

    -- Session
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            }
        end
    },

    -- EasyMotion
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended,
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config,
            require 'hop'.setup {
                keys = 'ahklyuiopnmqwertzxcvbsdgjf',
                multi_windows = false
            }
        end
    },

    -- UndoTree
    'mbbill/undotree',

    -- Latex,
    'lervag/vimtex',
    -- Markdown
    ({
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    }),
    'img-paste-devs/img-paste.vim',

    -- Test
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-vim-test",
            "vim-test/vim-test",
            "rouge8/neotest-rust",
        },
    },

    -- JSON5
    {
        'Joakker/lua-json5',
        build = './install.sh',
    },
})
