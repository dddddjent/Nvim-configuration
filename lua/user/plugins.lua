vim.loader.enable()
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
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = function()
            require "user.autopairs"
        end
    },
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require "user.comment"
        end
    },
    { "kyazdani42/nvim-web-devicons", },
    {
        "kyazdani42/nvim-tree.lua",
        event = "VeryLazy",
        config = function()
            require "user.nvim-tree"
        end
    },
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        config = function()
            require "user.bufferline"
        end
    },
    {
        "moll/vim-bbye",
        event = "VeryLazy"
    },
    { "nvim-lualine/lualine.nvim", },
    {
        "akinsho/toggleterm.nvim",
        event = "VeryLazy",
        config = function()
            require "user.toggleterm"
        end
    },
    { "ahmedkhalf/project.nvim", },
    -- use { "lewis6991/impatient.nvim", } -- substituted by vim.loader.enable()
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        branch = "master",
        commit = "b7aa0aed55887edfaece23f7b46ab22232fc8741",
        config = function()
            require "user.indentline"
        end
    },
    { "goolord/alpha-nvim" },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("user.whichkey")
        end
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = "VeryLazy"
    },
    {
        "ThePrimeagen/harpoon",
        event = "VeryLazy",
    },

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
    {
        "saadparwaiz1/cmp_luasnip",
        event = "VeryLazy",
    },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-omni" },
    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        -- optionally, override the default options:
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })
            require("cmp").config.formatting = {
                format = require("tailwindcss-colorizer-cmp").formatter
            }
        end
    },

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        event = "VeryLazy",
        config = function()
            require "user.luasnip"
        end
    },
    { "rafamadriz/friendly-snippets" },

    -- LSP
    { "neovim/nvim-lspconfig", },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
    },
    ({
        "glepnir/lspsaga.nvim",
        branch = "main",
        commit = "b7b4777369b441341b2dcd45c738ea4167c11c9e",
    }),
    { "ray-x/lsp_signature.nvim", },
    { "p00f/clangd_extensions.nvim" },
    { "mfussenegger/nvim-jdtls" },
    { "simrat39/rust-tools.nvim" },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
            -- options
        },
    },
    {
        'stevearc/conform.nvim',
        event = "VeryLazy",
    },

    -- Telescope
    { "nvim-telescope/telescope.nvim" },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/playground",
            "JoosepAlviste/nvim-ts-context-commentstring",
            "windwp/nvim-ts-autotag",
        },
        config = function()
            require "user.treesitter"
            require 'nvim-treesitter.configs'.setup {
                autotag = {
                    enable = true,
                }
            }
        end
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
    },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require "user.gitsigns"
        end
    },
    {
        'sindrets/diffview.nvim',
        event = "VeryLazy",
        dependencies = 'nvim-lua/plenary.nvim'
    },

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
        event = "VeryLazy",
        branch = 'v2', -- optional but strongly recommended,
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config,
            require 'hop'.setup {
                keys = 'ahklyuiopnmqwertzxcvbsdgjf',
                multi_windows = false
            }
            require "user.hop-config"
        end
    },

    -- UndoTree
    {
        'mbbill/undotree',
        event = "VeryLazy",
    },

    -- Latex,
    {
        'lervag/vimtex',
        event = "VeryLazy",
        config = function()
            require "user.vimtex"
        end
    },
    -- Markdown
    ({
        "iamcco/markdown-preview.nvim",
        event = "VeryLazy",
        build = "cd app && npm install",
        init = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    }),
    {
        'img-paste-devs/img-paste.vim',
        event = "VeryLazy"
    },

    -- Test
    {
        "nvim-neotest/neotest",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-vim-test",
            "vim-test/vim-test",
            "rouge8/neotest-rust",
        },
        config = function()
            require "user.test"
        end
    },

    -- JSON5
    {
        'Joakker/lua-json5',
        build = './install.sh',
    },

    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            vim.cmd "set termguicolors"
            vim.cmd "set t_Co=256"
            require('nvim-highlight-colors').setup {}
        end
    }
})
