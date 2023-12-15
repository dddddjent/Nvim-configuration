local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end
configs.setup(
    {
        ensure_installed = {
            "lua", "vim", "html", "javascript", "css",
            "cpp", "java", "rust", "python",
            'json', "cmake", "latex", "verilog", "bash"
        }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        ignore_install = {},
        matchup = {
            enable = false, -- mandatory, false will disable the whole extension
            -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
        },
        highlight = {
            enable = true, -- false will disable the whole extension
            additional_vim_regex_highlighting = false,
            disable = function(lang, buf)
                if vim.tbl_contains({ "latex" }, lang) then
                    return true
                end

                local max_filesize = 1024 * 1024
                local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    vim.schedule(function()
                        vim.api.nvim_buf_call(buf, function()
                            vim.cmd "setlocal noswapfile noundofile"

                            if vim.tbl_contains({ "json" }, lang) then
                                vim.cmd "NoMatchParen"
                                vim.cmd "syntax off"
                                vim.cmd "syntax clear"
                                vim.cmd "setlocal nocursorline nolist bufhidden=unload"

                                vim.api.nvim_create_autocmd({ "BufDelete" }, {
                                    callback = function()
                                        vim.cmd "DoMatchParen"
                                        vim.cmd "syntax on"
                                    end,
                                    buffer = buf,
                                })
                            end
                        end)
                    end)

                    print("File larger than 1MB, turned off treesitter for this buffer")

                    return true
                end
            end,
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
            config = {
                -- Languages that have a single comment style
                typescript = "// %s",
                css = "/* %s */",
                scss = "/* %s */",
                html = "<!-- %s -->",
                svelte = "<!-- %s -->",
                vue = "<!-- %s -->",
                json = "",
            },
        },
        indent = { enable = true, disable = { "yaml", "python" } },
        autotag = {
            enable = true,
            filetypes = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte',
                'vue', 'tsx', 'jsx', 'rescript',
                'xml',
                'php',
                'astro', 'glimmer', 'handlebars', 'hbs' },
        },
        textobjects = {
            swap = {
                enable = false,
                -- swap_next = textobj_swap_keymaps,
            },
            -- move = textobj_move_keymaps,
            select = {
                enable = false,
                -- keymaps = textobj_sel_keymaps,
            },
        },
        textsubjects = {
            enable = false,
            keymaps = { ["."] = "textsubjects-smart", [";"] = "textsubjects-big" },
        },
        playground = {
            enable = true,
            disable = {},
            updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = {
                toggle_query_editor = "o",
                toggle_hl_groups = "i",
                toggle_injected_languages = "t",
                toggle_anonymous_nodes = "a",
                toggle_language_display = "I",
                focus_language = "f",
                unfocus_language = "F",
                update = "R",
                goto_node = "<cr>",
                show_help = "?",
            },
        },
        rainbow = {
            enable = true,
            extended_mode = true,  -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
            max_file_lines = 3000, -- Do not enable for files with more than 1000 lines, int
        },
    }
)
