let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/.dotfiles/nvim/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +299 ~/.dotfiles/nvim/.config/nvim/init.vim
badd +74 ~/Desktop/nvim-deleted/init2.vim
badd +547 ~/Desktop/nvim-deleted/init3.vim
badd +590 ~/Downloads/bloat_init.vim
badd +5 ~/Desktop/dalia
badd +196 ~/Desktop/utf8-sample.txt
argglobal
%argdel
edit ~/.dotfiles/nvim/.config/nvim/init.vim
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 88 + 88) / 176)
exe 'vert 2resize ' . ((&columns * 87 + 88) / 176)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 299 - ((12 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
299
let s:c = 81 - ((72 * winwidth(0) + 44) / 88)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 81 . '|'
else
  normal! 081|
endif
wincmd w
argglobal
if bufexists("~/Desktop/utf8-sample.txt") | buffer ~/Desktop/utf8-sample.txt | else | edit ~/Desktop/utf8-sample.txt | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 209 - ((17 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
209
normal! 048|
wincmd w
exe 'vert 1resize ' . ((&columns * 88 + 88) / 176)
exe 'vert 2resize ' . ((&columns * 87 + 88) / 176)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFAIc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
