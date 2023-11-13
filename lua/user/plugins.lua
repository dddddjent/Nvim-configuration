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
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     event = "VeryLazy",
    --     branch = "master",
    --     commit = "b7aa0aed55887edfaece23f7b46ab22232fc8741",
    --     config = function()
    --         require "user.indentline"
    --     end
    -- },
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
    { 'Everblush/nvim',           name = 'everblush' },

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
    -- { "Jezda1337/nvim-html-css",
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         "nvim-lua/plenary.nvim"
    --     },
    --     config = function()
    --         require("html-css"):setup()
    --     end,
    --     event = 'VeryLazy',
    --     enable = false
    -- },

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
        -- commit = "b7b4777369b441341b2dcd45c738ea4167c11c9e",
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
    -- need lazy.nvim
    {
        "microsoft/python-type-stubs",
        cond = false
    },

    -- Telescope
    { "nvim-telescope/telescope.nvim" },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },
    {
        'nvim-pack/nvim-spectre',
        dependencies = 'nvim-lua/plenary.nvim',
        build = "build.sh nvim-oxi",
        config = function()
            require('user.spectre')
        end,
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
                    filetypes = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte',
                        'vue', 'tsx', 'jsx', 'rescript',
                        'xml',
                        'php',
                        'astro', 'glimmer', 'handlebars', 'hbs' },
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
        'NvChad/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup {
                filetypes = {
                    'html',
                    'javascript',
                    css = { mode = 'virtualtext', },
                    lua = { names = false }
                },
                user_default_options = {
                    mode = "background",
                    RGB = true,       -- #RGB hex codes
                    RRGGBB = true,    -- #RRGGBB hex codes
                    names = true,     -- "Name" codes like Blue or blue
                    RRGGBBAA = true,  -- #RRGGBBAA hex codes
                    AARRGGBB = false, -- 0xAARRGGBB hex codes
                    rgb_fn = true,    -- CSS rgb() and rgba() functions
                    hsl_fn = true,    -- CSS hsl() and hsla() functions
                    css = true,       -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                    css_fn = true,    -- Enable all CSS *functions*: rgb_fn, hsl_fn
                    -- Available methods are false / true / "normal" / "lsp" / "both"
                    -- True is same as normal
                    tailwind = true, -- Enable tailwind colors
                },
            }
        end
    },

    -- lua with packer.nvim
    {
        "max397574/better-escape.nvim",
        config = function()
            -- lua, default settings
            require("better_escape").setup {
                mapping = { "kj", "jk", }, -- a table with mappings to use
                timeout = 200,             -- the time in which the keys must be hit in ms. Use option timeoutlen by default
                clear_empty_lines = false, -- clear line after escaping if there is only whitespace
                keys = "<Esc>",            -- keys used for escaping, if it is a function will use the result everytime
                -- example(recommended)
                -- keys = function()
                --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
                -- end,
            }
        end,
    },
    { "ja-ford/delaytrain.nvim" },
})
