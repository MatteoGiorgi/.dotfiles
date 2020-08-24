"
"                          ██▒   █▓ ██▓ ███▄ ▄███▓
"                         ▓██░   █▒▓██▒▓██▒▀█▀ ██▒
"                          ▓██  █▒░▒██▒▓██    ▓██░
"                           ▒██ █░░░██░▒██    ▒██
"                            ▒▀█░  ░██░▒██▒   ░██▒
"                            ░ ▐░  ░▓  ░ ▒░   ░  ░
"                            ░ ░░   ▒ ░░  ░      ░
"                              ░░   ▒ ░░      ░
"                               ░   ░         ░
"                              ░
"
" Vim config file, let's try to use it as vanilla as possible!
" In the spirit of keeping things minimal, I haven't add any plugin whatsoever.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


syntax on
color dracula
hi Normal ctermbg=NONE
filetype plugin indent on

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

augroup vimrc
    autocmd InsertEnter * set cul
    autocmd InsertLeave * set nocul
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set runtimepath+=~/.vim_runtime
set clipboard=unnamedplus
set number relativenumber
set mouse=a
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set omnifunc=syntaxcomplete#Complete
set t_Co=256
set hlsearch
set colorcolumn=81
set wrap
set textwidth=80
set linebreak
set wildmenu
set wildmode=list:longest,list:full
set foldmethod=manual
set smartcase
set encoding=UTF-8
set nobackup
set noshowmode
set showcmd
set nocursorline
set noerrorbells
set nofoldenable
set nospell

set laststatus=2
set statusline=
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%<
set statusline+=\ \|\ %F
set statusline+=\ %{&modified?'+\ ':''}
set statusline+=%{&readonly?'\ ':''}
set statusline+=\ %=
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=%(\ \|%{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
  \.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
set statusline+=%(\ \|\ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
set statusline+=\ \|
set statusline+=\ %{&number?'':printf('%2d,',line('.'))}
set statusline+=%-2v
set statusline+=\ %2p%%
set statusline+=\ 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:mapleader = "\<space>"
let g:maplocalleader = ','
let g:switchedit = 'horizontal'
let g:switchdir = 'home'
let g:longline = 'none'
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'N·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal',
    \}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if exists('g:loaded_fff')
    finish
endif
let g:loaded_fff = 1
let g:fff#split = '30vnew'
let g:fff#split_direction = 'nosplitbelow nosplitright'

command! -nargs=* -complete=dir F call fff#Run(<q-args>)
command! -bar RangerChooser call fff#RangerChooser()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


noremap <C-h> <C-W><C-<>
noremap <C-l> <C-W><C->>
noremap <C-j> <C-W><C-->
noremap <C-k> <C-W><C-+>
noremap <S-h> <C-W><C-H>
noremap <S-k> <C-W><C-K>
noremap <S-j> <C-W><C-J>
noremap <S-l> <C-W><C-L>
noremap <leader>q :quit<CR>
noremap <leader>w :write<CR>
noremap <leader>c :bdelete<CR>
noremap <leader>o :wincmd o<CR>
noremap <leader>b :enew<CR>
noremap <leader>s :new<CR>
noremap <leader>v :vnew<CR>
noremap <leader><space> :F<CR>
noremap <leader>p :setlocal nowrap!<CR>
noremap <leader>r :wincmd r<CR>
noremap <leader>e :call SwitchEdit()<CR>
noremap <leader>i :call SwitchDir()<CR>
noremap <leader>0 :wincmd =<CR>
noremap <leader>1 :w! \| !comp <c-r>%<CR><CR>
noremap <leader>2 :!opout <c-r>%<CR><CR>
noremap <leader>3 :set hlsearch! hlsearch?<CR>
noremap <leader>4 :setlocal spell! spelllang=en_us<CR>
noremap <leader>5 :call LongLine()<CR>
noremap <leader>6 <esc>ggVGgq<CR>

nmap <leader>u <esc>gx<CR>
nmap <silent><Tab> :buffers<CR>:buffer<Space>

nmap <C-p> :-r!xclip -o -sel clip<CR>
vmap <C-y> :!xclip -f -sel clip<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


function! LongLine()
    if (g:longline ==? 'none')
        let g:longline = 'all'
        :setlocal virtualedit=all
    else
        let g:longline = 'none'
        :setlocal virtualedit=
    endif
endfunction


function! SwitchDir()
    if (g:switchdir ==? 'home')
        let g:switchdir = 'local'
        :lcd %:p:h
        :pwd
    else
        let g:switchdir = 'home'
        :lcd ~
        :pwd
    endif
endfunction


function! SwitchEdit()
    if (g:switchedit ==? 'horizontal')
        let g:switchedit = 'vertical'
        :wincmd H
    else
        let g:switchedit = 'horizontal'
        :wincmd K
    endif
endfunction

