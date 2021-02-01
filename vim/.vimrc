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


"SETTINGS_______________________________________________________________________

syntax on
color dracula16
filetype plugin indent on

set runtimepath+=~/.vim_runtime
set clipboard=unnamedplus
set number relativenumber
set mouse=a
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set hlsearch
set incsearch
set colorcolumn=81
set wrap
set formatoptions+=l
set smartcase
set smartindent
set encoding=UTF-8
scriptencoding utf-8
set noswapfile
set nobackup
set showmode
set showcmd
set nocursorline
set noerrorbells
set nofoldenable
set foldmethod=manual
set nospell
set wildmenu
set wildmode=list:longest,list:full
set omnifunc=syntaxcomplete#Complete
set complete+=k/usr/share/dict/british-english
set complete+=k/usr/share/dict/italian
set completeopt=menuone,longest
set shortmess+=c
set laststatus=2
set t_Co=256

if exists('+termguicolors')
    set termguicolors
endif

if has('linebreak')
    let &showbreak='⤷ '
endif

highlight LineNr       guibg=NONE
highlight SignColumn   guibg=NONE
highlight CursorLineNr guibg=NONE guifg=#F1FA8C

highlight CursorLine  guibg=#2A2C38
highlight ColorColumn guibg=#2A2C38




"AUTOGROUPS_____________________________________________________________________

" Change linenumber behaviour in insert mode
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" Change cursorline colors in insert mode
augroup vimrc
    autocmd InsertEnter * set cul
    autocmd InsertLeave * set nocul
augroup END




"MY_VARIABLES___________________________________________________________________

let g:mapleader = "\<space>"
let g:maplocalleader = ','
let g:netrw_browsex_viewer = 'xdg-open'




"NETRW__________________________________________________________________________

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_altv = 1




"KEYMAPPINGS____________________________________________________________________


nnoremap <silent><C-h> :vertical resize -5<CR>
nnoremap <silent><C-l> :vertical resize +5<CR>
nnoremap <silent><C-j> :resize -5<CR>
nnoremap <silent><C-k> :resize +5<CR>

nnoremap <leader>k :new<CR>
nnoremap <leader>j :belowright new<CR>
nnoremap <leader>h :vnew<CR>
nnoremap <leader>l :belowright vnew<CR>

xnoremap K :move '<-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv

nnoremap <leader>w <C-W>
nnoremap <leader>q :quit<CR>
nnoremap <leader>z :write<CR>
nnoremap <leader>e :enew<CR>
nnoremap <leader>d :bdelete<CR>

nnoremap <leader><Space> :Explore<CR>
nmap <leader><Tab> :bnext<CR><C-g>

nmap <C-p> :-r!xclip -o -sel clip<CR>
vmap <C-y> :!xclip -f -sel clip<CR>
map  <leader>u <esc>gx

vmap <Tab> >gv
vmap <S-Tab> <gv

nnoremap <leader>r :%s///gc<Left><Left><Left>
xnoremap <leader>r :s///gc<Left><Left><Left>
