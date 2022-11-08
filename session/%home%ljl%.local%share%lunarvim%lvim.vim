let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.local/share/lunarvim/lvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/.local/share/lunarvim/lvim/lua/lvim/lsp/config.lua
badd +1 ~/.local/share/lunarvim/lvim/lua/lvim/core/lualine/components.lua
badd +6 ~/.local/share/lunarvim/lvim/lua/lvim/core/lualine/conditions.lua
badd +95 ~/.local/share/lunarvim/lvim/lua/lvim/core/lualine/styles.lua
badd +4 ~/.local/share/lunarvim/lvim/lua/lvim/core/lualine/utils.lua
badd +48 ~/.local/share/lunarvim/lvim/lua/lvim/core/lualine/init.lua
badd +122 ~/.local/share/lunarvim/lvim/lua/lvim/core/dap.lua
argglobal
%argdel
$argadd ~/.local/share/lunarvim
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
