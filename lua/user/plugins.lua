vim.loader.enable()
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            -- require "user.lualine"
        end
    },
    {
        "akinsho/toggleterm.nvim",
        event = "VeryLazy",
        config = function()
            require "user.toggleterm"
        end
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require "user.alpha"
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("user.whichkey")
        end
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = "VeryLazy",
        config = function()
            require "user.delimiters"
        end
    },

    -- Colorschemes
    { "lunarvim/darkplus.nvim" },
    {
        "catppuccin/nvim",
    },
    { 'folke/tokyonight.nvim' },
    { 'luisiacc/gruvbox-baby' },
    { "ellisonleao/gruvbox.nvim" },
    { "olimorris/onedarkpro.nvim" },
    { 'Everblush/nvim',           name = 'everblush' },

    -- Cmp
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("user.cmp")
        end
    },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    {
        "saadparwaiz1/cmp_luasnip",
        event = "VeryLazy",
    },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-omni" },
    { "hrsh7th/cmp-cmdline" },
    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })
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
    -- { "rafamadriz/friendly-snippets" },

    -- LSP
    { "neovim/nvim-lspconfig", },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    {
        "nvimtools/none-ls.nvim",
        commit = "bb680d752cec37949faca7a1f509e2fe67ab418a",
    },
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
    },
    ({
        "glepnir/lspsaga.nvim",
        branch = "main",
    }),
    { "ray-x/lsp_signature.nvim", },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {},
    },

    -- Search
    {
        'nvim-pack/nvim-spectre',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('user.spectre')
        end,
    },
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require "user.fzf_lua"
        end,
        event = "VeryLazy",
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
            if OS == "windows" then
                require 'nvim-treesitter.install'.compilers = { 'clang' }
            end
            require "user.treesitter"
        end
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
        config = function()
            require "user.ufo-config"
        end
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

    -- Session
    {
        "rmagatti/auto-session",
        config = function()
            require "user.autosession"
        end
    },

    -- EasyMotion
    {
        'phaazon/hop.nvim',
        event = "VeryLazy",
        branch = 'v2',
        config = function()
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
            require "user.neotest"
        end
    },

    -- JSON5
    {
        'Joakker/lua-json5',
        build = './install.sh',
    },

    {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require "user.nvim-colorizer"
        end
    },

    {
        "max397574/better-escape.nvim",
        config = function()
            require "user.better-escape"
        end,
    },

    -- need lazy.nvim
    {
        "microsoft/python-type-stubs",
        cond = false
    },
    -- { "ja-ford/delaytrain.nvim" },

    {
        "LunarVim/bigfile.nvim",
        config = function()
            -- default config
            require("bigfile").setup {
                filesize = 1,      -- size of the file in MiB, the plugin round file sizes to the closest MiB
                pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
                features = {       -- features to disable
                    "illuminate",
                    -- "lsp",
                    "treesitter",
                    "syntax",
                    "matchparen",
                    "vimopts",
                    "filetype",
                },
            }
        end
    }
})
