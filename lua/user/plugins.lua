local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    use { "wbthomason/packer.nvim" } -- Have packer manage itself
    use { "nvim-lua/plenary.nvim" }
    use { "windwp/nvim-autopairs" }
    use { "numToStr/Comment.nvim" }
    use { "JoosepAlviste/nvim-ts-context-commentstring" }
    use { "kyazdani42/nvim-web-devicons", }
    use { "kyazdani42/nvim-tree.lua", }
    use { "akinsho/bufferline.nvim", }
    use { "moll/vim-bbye", }
    use { "nvim-lualine/lualine.nvim", }
    use { "akinsho/toggleterm.nvim", }
    use { "ahmedkhalf/project.nvim", }
    use { "lewis6991/impatient.nvim", }
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "goolord/alpha-nvim" }
    use { "folke/which-key.nvim" }
    use { "catppuccin/nvim" }
    use { 'folke/tokyonight.nvim' }
    use { "p00f/nvim-ts-rainbow" }
    use { "ThePrimeagen/harpoon" }

    -- Colorschemes
    use { "lunarvim/darkplus.nvim" }

    -- Cmp
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-nvim-lua" }
    use { "hrsh7th/cmp-omni" }

    -- Snippets
    use { "L3MON4D3/LuaSnip" }
    use { "rafamadriz/friendly-snippets" }

    -- LSP
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "jose-elias-alvarez/null-ls.nvim" }
    use { "RRethy/vim-illuminate" }
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
    })
    use { "p00f/clangd_extensions.nvim" }
    use { "mfussenegger/nvim-jdtls" }
    use { "folke/neodev.nvim" }

    -- Telescope
    use { "nvim-telescope/telescope.nvim" }
    use { 'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter" }
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
use { 'nvim-treesitter/playground', after = 'nvim-treesitter' }

    -- Git
    use { "lewis6991/gitsigns.nvim" }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- Dap
    use { "mfussenegger/nvim-dap" }
    use { "rcarriga/nvim-dap-ui" }
    use { "theHamsta/nvim-dap-virtual-text" }
    use { "nvim-telescope/telescope-dap.nvim" }

    -- Session
    use {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            }
        end
    }

    -- EasyMotion
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup {
                keys = 'ahklyuiopnmqwertzxcvbsdgjf',
                multi_windows = false
            }
        end
    }

    -- UndoTree
    use 'mbbill/undotree'

    -- Latex
    use 'lervag/vimtex'
    -- Markdown
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use 'img-paste-devs/img-paste.vim'

    -- Test
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-vim-test",
            "vim-test/vim-test"
        }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
