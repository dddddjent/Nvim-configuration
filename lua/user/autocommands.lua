vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _dap
    autocmd!
    autocmd FileType dapui* set statusline=%-f
    autocmd FileType dap-repl set statusline=\
  augroup end

   augroup _lsp
    autocmd!
    autocmd FileType java lua require('user.lsp.extra.jdtls').set_jdtls()
    " autocmd FileType html lua require("html-css"):setup()
   augroup end

  augroup _paste_image
    autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
    autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'
  augroup end
]]
