return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install({
            "lua", "vim", "html", "javascript", "css",
            "cpp", "java", "rust", "python", "typescript",
            'json', "cmake", "latex", "verilog", "bash", "tsx", "go", "gomod",
            "toml", "yaml", "xml"
        }):wait(300000)
    end,
}
