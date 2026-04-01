MISE_DEP_DIR = "/usr/local/share/mise/data/installs"

return {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    build = "cd app && ".. MISE_DEP_DIR .. "/node/lts/bin/" .."npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
    keys = { 
        {"<leader>ms", "<Plug>MarkdownPreview", desc = "Preview start", mode = "n"},
    },
}
