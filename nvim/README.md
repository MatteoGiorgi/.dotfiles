## Plugins to be installed in the near future

-  vim-unimpaired            https://github.com/tpope/vim-unimpaired
-  vim-ctrlspace             https://github.com/vim-ctrlspace/vim-ctrlspace




### disable netrw at start

`let g:loaded_netrw = 1`
`let g:loaded_netrwPlugin = 1`




### startpage at start inside `augroup vimenter`

`call utility#Start() "intro`
`nnoremap <leader>i :bufdo bdelete<Bar>Shortcuts<CR>`




### easyterm function

`function! utility#EasyTerm(args)`
`    botright 20new`
`    exe 'terminal' a:args`
`    tnoremap <buffer> <Esc> <C-\><C-n>:bdelete!<CR>`
`    tnoremap <buffer> <expr> <C-v> '<C-\><C-N>pi'`
`endfun`

`augroup easyterm`
`    autocmd!`
`    autocmd TermOpen * startinsert`
`    autocmd TermOpen * setlocal nonumber norelativenumber`
`    autocmd TermOpen * setlocal statusline=%!superbar#Silent()`
`augroup END`




### superbar
`" Change multiple statusbar in vimenter`
`augroup statuslineautocmds`
`    autocmd!`
`    autocmd VimEnter              * call superbar#UpdateInactiveWindows()`
`    autocmd WinEnter,BufWinEnter  * call superbar#StatusLine("active")`
`    autocmd WinLeave              * call superbar#StatusLine("inactive")`
`augroup END`




### buftabline
`highlight BufTabLineCurrent guibg=#3A3C4E guifg=#BFBFBF gui=none`
`highlight BufTabLineActive  guibg=#3A3C4E guifg=#BFBFBF gui=none`
`highlight BufTabLineHidden  guibg=#3A3C4E guifg=#626483 gui=none`
`highlight BufTabLineFill    guibg=#3A3C4E`

`let g:buftabline_show = 1`
`let g:buftabline_numbers = 2`

`nmap <leader>1 <Plug>BufTabLine.Go(1)`
`nmap <leader>2 <Plug>BufTabLine.Go(2)`
`nmap <leader>3 <Plug>BufTabLine.Go(3)`
`nmap <leader>4 <Plug>BufTabLine.Go(4)`
`nmap <leader>5 <Plug>BufTabLine.Go(5)`
`nmap <leader>6 <Plug>BufTabLine.Go(6)`
`nmap <leader>7 <Plug>BufTabLine.Go(7)`
`nmap <leader>8 <Plug>BufTabLine.Go(8)`
`nmap <leader>9 <Plug>BufTabLine.Go(9)`
`nmap <leader>0 <Plug>BufTabLine.Go(10)`





### coq-vim                   https://github.com/tounaishouta/coq.vim

`" Run coq plugin`
`augroup coq`
`    autocmd Filetype coq nnoremap <leader><Return> :CoqRunToCursor<CR>`
`    autocmd Filetype coq nnoremap <leader><Backspace> :bdelete __coq_ide__<CR>`
`augroup END`
