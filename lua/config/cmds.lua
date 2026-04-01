vim.cmd"command RestoreSession :SessionRestore"

vim.cmd"set fencs=utf-8,gbk,big5,cp936,gb18030,gb2312,utf-16"

-- remove status line
vim.cmd"set laststatus=0"
vim.cmd"hi! link StatusLine Normal"
vim.cmd"hi! link StatusLineNC Normal"
vim.cmd"set statusline=%{repeat('─',winwidth('.'))}"

vim.cmd([[
function OpenMarkdownPreview (url)
    execute "silent ! firefox --new-window " . a:url
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]])

vim.cmd[[
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
    " autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _dap
    autocmd!
    autocmd FileType dapui* set statusline=%-f
    autocmd FileType dap-repl set statusline=\
  augroup end

  augroup _paste_image
    autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
    autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'
  augroup end
]]

local glsl_extensions = { '*.vert', '*.frag', '*.glsl', '*.tesc', '*.tese', '*.geom', '*.comp' }
for _, extension_name in ipairs(glsl_extensions) do
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
        pattern = extension_name,
        command = 'set filetype=glsl',
    })
end
