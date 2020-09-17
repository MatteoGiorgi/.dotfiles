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


                          " VIM EXTENSIONS
"                   [ Plug 'repo-name/plugin-name' ]
"
"    vim-plug                  https://github.com/junegunn/vim-plug
"    supertab                  https://github.com/ervandew/supertab
"    auto-pairs                https://github.com/jiangmiao/auto-pairs
"    vim-surround              https://github.com/tpope/vim-surround
"    vim-commentary            https://github.com/tpope/vim-commentary
"    fzf                       https://github.com/junegunn/fzf.vim




"VIM_PLUG_______________________________________________________________________

call plug#begin('~/.vim/plugged')
    Plug 'ervandew/supertab'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/fzf', {'do': { -> fzf#install() }} | Plug 'junegunn/fzf.vim'
call plug#end()




"SETTINGS_______________________________________________________________________

syntax on
color dracula
filetype plugin indent on

set runtimepath+=~/.vim_runtime
set clipboard=unnamedplus
set number relativenumber
set mouse=a
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set hlsearch
set incsearch
set colorcolumn=81
set nowrap
set formatoptions+=l
set smartcase
set smartindent
set encoding=UTF-8
scriptencoding utf-8
set noswapfile
set nobackup
set noshowmode
set showcmd
set nocursorline
set noerrorbells
set nofoldenable
set foldmethod=manual
set nospell
set wildmenu
set wildmode=list:longest,list:full
set omnifunc=syntaxcomplete#Complete
set t_Co=256

if exists('+termguicolors')
    set termguicolors
endif

if has('linebreak')
    let &showbreak='⤷ '
endif

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

augroup vimrc
    autocmd InsertEnter * set cul
    autocmd InsertLeave * set nocul
augroup END




"STATUSLINE_____________________________________________________________________

set laststatus=2
set statusline=
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%<
set statusline+=\ \\ %F
set statusline+=\ %{&modified?'+\ ':''}
set statusline+=%{&readonly?'\ ':''}
set statusline+=\ %=
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=%(\ \|%{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
    \.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
set statusline+=%(\ \\ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
set statusline+=\ \
set statusline+=\ %{&number?'':printf('%2d,',line('.'))}
set statusline+=%-2v
set statusline+=\ %2p%%
set statusline+=\ 




"MY_VARIABLES___________________________________________________________________

let g:mapleader = "\<space>"
let g:maplocalleader = ','
let g:netrw_browsex_viewer = 'xdg-open'
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




"NETRW__________________________________________________________________________

let g:netrw_winsize = -30
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_browse_split = 4
let g:netrw_altv = 1




"FFF____________________________________________________________________________

if exists('g:loaded_fff')
    finish
endif
let g:loaded_fff = 1
let g:fff#split = '30vnew'
let g:fff#split_direction = 'nosplitbelow nosplitright'
command! -nargs=* -complete=dir F call fff#Run(<q-args>)




"SWITCH_________________________________________________________________________

command! -nargs=1 ChangeRoot call switch#change_root(<f-args>)
command! ChangeRootCurrent call switch#change_root_current()
command! SwitchDir call switch#switch_dir()




"SUPERTAB_______________________________________________________________________

let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-n>'




"KEYMAPPINGS____________________________________________________________________

" Generics
nnoremap <C-h> <C-W><C-<>
nnoremap <C-l> <C-W><C->>
nnoremap <C-j> <C-W><C-->
nnoremap <C-k> <C-W><C-+>
nnoremap <M-space> <C-W>w

nnoremap <silent> <S-j> }}{ zz
nnoremap <silent> <S-k> {{ zz

nnoremap <leader>w <C-W>
nnoremap <leader>q :quit<CR>
nnoremap <leader>z :write<CR>
nnoremap <leader>k :bdelete<CR>
nnoremap <leader>o :only<CR>

map <leader>u <esc>gx
nmap <silent><Tab> :bnext<CR>
nmap <silent>\ :bprev<CR>
nmap <C-p> :-r!xclip -o -sel clip<CR>
vmap <C-y> :!xclip -f -sel clip<CR>
vmap <Tab> >gv
vmap <S-Tab> <gv


" Replace selection
nnoremap <leader>r :%s///gc<Left><Left><Left>
xnoremap <leader>r :s///gc<Left><Left><Left>


" Switch
nnoremap <leader>C :ChangeRoot<space>
nnoremap <leader>c :ChangeRootCurrent<CR>
nnoremap <leader>d :SwitchDir<CR>


" FFF & Explorer
nnoremap <leader>\ :F<CR>
nnoremap <leader><Tab> :call ToggleVExplorer()<CR>


" Commentary
nmap <leader>l gcc
vmap <leader>l gc


" Surround
map  <leader>j <esc>ysiw
vmap <leader>j <S-s>
map  <leader>s <esc>cs
map  <leader>S <esc>ds


" Fzf
nnoremap <leader>f :Files!<CR>
nnoremap <leader>g :GFiles!<CR>
nnoremap <leader>b :BLines!<CR>
nnoremap <leader><space> :Commands!<CR>




"FUNCTIONS______________________________________________________________________

function! s:long_line()
    if (g:longline ==? 'none')
        let g:longline = 'all'
        setlocal virtualedit=all
    else
        let g:longline = 'none'
        setlocal virtualedit=
    endif
endfunction


function! ToggleVExplorer()
    if exists('t:expl_buf_num')
        let expl_win_num = bufwinnr(t:expl_buf_num)
        let cur_win_num = winnr()
        if expl_win_num != -1
            while expl_win_num != cur_win_num
                exec 'wincmd w'
                let cur_win_num = winnr()
            endwhile
            close
        endif
        unlet t:expl_buf_num
    else
        Vexplore
        let t:expl_buf_num = bufnr('%')
    endif
endfunction




"OTHER_USEFUL_COMMANDS__________________________________________________________

command! Squish execute "normal \ggVGgq"
command! Longline call s:long_line()

