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
