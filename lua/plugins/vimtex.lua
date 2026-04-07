-- If your project layout does not have main.tex in a parent directory, 
-- this fallback will not catch it. 
-- In that case, put a root directive in the included file’s first five lines, 
-- for example:
-- %! TEX root = ../main.tex


local function has_explicit_vimtex_root(file)
    local lines = vim.fn.readfile(file, "", 5)

    for _, line in ipairs(lines) do
        local lower = line:lower()
        if lower:match("^%s*%%%s*!?%s*tex%s+root%s*[:=]") then
            return true
        end

        if line:match("^%s*\\documentclass") then
            return true
        end
    end

    return false
end

local function find_parent_main_tex(file)
    local dir = vim.fs.dirname(file)
    if not dir then
        return nil
    end

    local matches = vim.fs.find("main.tex", {
        path = dir,
        type = "file",
        upward = true,
    })

    return matches[1]
end

return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        local augroup = vim.api.nvim_create_augroup("vimtex_main_fallback", { clear = true })

        vim.cmd("syntax enable")

        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_callback_progpath = "/usr/local/bin/nvim"
        vim.g.vimtex_fold_enabled = 1
        vim.g.vimtex_format_enabled = 1
        vim.g.vimtex_compiler_method = "latexmk"

        vim.api.nvim_create_autocmd("BufReadPre", {
            group = augroup,
            pattern = "*.tex",
            callback = function(args)
                local file = vim.api.nvim_buf_get_name(args.buf)
                if file == "" or vim.fs.basename(file) == "main.tex" then
                    return
                end

                if has_explicit_vimtex_root(file) then
                    return
                end

                -- When an \input file is opened directly, VimTeX may treat it as
                -- the main document and look for a non-existent sibling PDF.
                -- Fallback to the nearest parent main.tex so forward sync uses
                -- the project PDF unless the file already declares its own root.
                local main = find_parent_main_tex(file)
                if not main or vim.fn.filereadable(main) == 0 or main == file then
                    return
                end

                vim.b[args.buf].vimtex_main = main
            end,
        })
    end,
    keys = {
        mode = "n",
        group = "VimTeX",
        { "<leader>vc", "<Plug>(vimtex-compile)", desc = "Compile LaTeX" },
        { "<leader>vi", "<Plug>(vimtex-info)",    desc = "Info" },
        { "<leader>vs", "<cmd>VimtexView<cr>",    desc = "Sychronize" },
    },
}
