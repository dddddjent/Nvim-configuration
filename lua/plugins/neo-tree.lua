return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    opts = {
        window = {
            position = "float",
            mappings = {
                ["l"] = "open",
                ["h"] = "close_node",
            },
        },
        filesystem = {
          filtered_items = {
              visible = true, -- when true, they will just be displayed differently than normal items
              hide_dotfiles = true,
              hide_gitignored = true,
          },
        },
    },
    keys = {
        {"<leader>e", "<Cmd>Neotree toggle<CR>", desc = "Neotree toggle", mode = "n"}
    },
    lazy = false, -- neo-tree will lazily load itself
}
