"
"                        ________  ..    ________
"                       /VVVVVVVV\++++  /VVVVVVVV\
"                       \VVVVVVVV/++++++\VVVVVVVV/
"                        |VVVVVV|++++++++/VVVVV/`
"                        |VVVVVV|++++++/VVVVV/`
"                       +|VVVVVV|++++/VVVVV/`+
"                     +++|VVVVVV|++/VVVVV/`+++++
"                   +++++|VVVVVV|/VVVVV/`+++++++++
"                     +++|VVVVVVVVVVV/`+++++++++
"                       +|VVVVVVVVV/`+++++++++
"                        |VVVVVVV/`+++++++++
"                        |VVVVV/`+++++++++
"                        |VVV/`+++++++++
"                        `V/`   ++++++
"                                 ++
"
"
"                           VIM EXTENSIONS
"                   [ Plug 'repo-name/plugin-name' ]
"
"    vim-plug                https://github.com/junegunn/vim-plug
"    ale                     https://github.com/dense-analysis/ale
"    coc                     https://github.com/neoclide/coc.nvim
"    supertab                https://github.com/ervandew/supertab
"    rnvimr                  https://github.com/kevinhwang91/rnvimr
"    vim-airline             https://github.com/vim-airline/vim-airline
"    vim-airline-themes      https://github.com/vim-airline/vim-airline-themes
"    vim-startify            https://github.com/mhinz/vim-startify
"    vim-fugitive            https://github.com/tpope/vim-fugitive
"    fzf                     https://github.com/junegunn/fzf.vim
"    auto-pairs              https://github.com/jiangmiao/auto-pairs
"    vim-surround            https://github.com/tpope/vim-surround
"    vim-multiple-cursors    https://github.com/terryma/vim-multiple-cursors
"    vim-easymotion          https://github.com/easymotion/vim-easymotion
"    vim-commentary          https://github.com/tpope/vim-commentary
"    vim-gitgutter           https://github.com/airblade/vim-gitgutter
"    vim-which-key           https://github.com/liuchengxu/vim-which-key
"    goyo.vim                https://github.com/junegunn/goyo.vim
"    limelight               https://github.com/junegunn/limelight.vim
"    vim-pandoc              https://github.com/vim-pandoc/vim-pandoc
"    vim-pandoc-syntax       https://github.com/vim-pandoc/vim-pandoc-syntax
"    vimtex                  https://github.com/lervag/vimtex
"    dracula                 https://github.com/dracula/vim/
"    vim-devicons            https://github.com/ryanoasis/vim-devicons
"
"
"                           COC EXTENSIONS
"                     [ :CocInstall plugin-name ]
"
"    coc-marketplace         https://github.com/fannheyward/coc-marketplace
"    coc-vimtex              https://github.com/neoclide/coc-vimtex
"    coc-vimlsp              https://github.com/iamcco/coc-vimlsp
"    coc-clang               https://github.com/clangd/coc-clangd
"    coc-sh                  https://github.com/josa42/coc-sh
"    coc-python              https://github.com/neoclide/coc-python
"    coc-java                https://github.com/neoclide/coc-java


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo 'Downloading junegunn/vim-plug to manage plugins...'
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" >
                \ ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
    Plug 'dense-analysis/ale'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ervandew/supertab'
    Plug 'kevinhwang91/rnvimr'
    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
    Plug 'mhinz/vim-startify'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-commentary'
    Plug 'airblade/vim-gitgutter'
    Plug 'liuchengxu/vim-which-key'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'vim-pandoc/vim-pandoc' | Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'lervag/vimtex'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'ryanoasis/vim-devicons'
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


syntax on
color dracula
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

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave() 

autocmd VimEnter *
            \ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) |
            \     PlugInstall --sync | q |
            \ endif

highlight Normal ctermbg=NONE
highlight GitGutterAdd ctermfg=Green
highlight GitGutterChange ctermfg=Yellow
highlight GitGutterDelete ctermfg=Red
highlight link RnvimrNormal CursorLine


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set clipboard=unnamedplus
set number relativenumber
set mouse=a
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set hlsearch
set colorcolumn=81
set wrap
set textwidth=80
set linebreak
set foldmethod=manual
set smartcase
set encoding=UTF-8
set nobackup
set noshowmode
set noshowcmd
set nocursorline
set noerrorbells
set nofoldenable
set nospell
set timeoutlen=100

if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:mapleader = "\<space>"
let g:maplocalleader = ','
let g:netrw_browsex_viewer= 'xdg-open'
let g:switchedit = 'horizontal'
let g:switchdir = 'home'
let g:longline = 'none'
let g:ale_linters = {
            \ 'c': ['gcc'],
            \ 'python': ['flake8', 'pylint'],
            \ 'javascript': ['eslint'],
            \}
let g:ale_fixers = {
            \ 'python': ['yapf'],
            \}
let g:ale_fix_on_save = 1
let g:tex_flavor = 'latex'
let g:SuperTabDefaultCompletionType = 'context'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:goyo_width = 100
let g:goyo_height = '80%'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'minimalist'
let g:limelight_conceal_ctermfg = 240
let g:startify_files_number = 5
let g:startify_list_order = [
            \ ['   Files:'], 'files',
            \ ['   Dir:'], 'dir',
            \ ['   Sessions:'], 'sessions',
            \ ['   Bookmarks:'], 'bookmarks',
            \ ]
let g:startify_bookmarks = [
            \ '~/.config/nvim/init.vim',
            \ '~/.config/qtile/config.py',
            \ '~/.zshrc',
            \ '~/.bashrc',
            \ '~/.vimrc',
            \ ]
let g:startify_custom_header = [
            \ '        ███▄ ▄███▓    ██▒   █▓ ██▓ ███▄ ▄███▓       ',
            \ '        ██▒▀█▀ ██▒   ▓██░   █▒▓██▒▓██▒▀█▀ ██▒       ',
            \ '        ██    ▓██░    ▓██  █▒░▒██▒▓██    ▓██░       ',
            \ '        ██    ▒██      ▒██ █░░░██░▒██    ▒██        ',
            \ '        ██▒   ░██▒ █▓   ▒▀█░  ░██░▒██▒   ░██▒       ',
            \ '         ▒░   ░  ░  ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░       ',
            \ '          ░      ░      ░ ░░   ▒ ░░  ░      ░       ',
            \ '          ░               ░░   ▒ ░░      ░          ',
            \ '                           ░   ░         ░          ',
            \ '                          ░                         ',
            \ ]
let g:rnvimr_enable_ex = 1
let g:rnvimr_enable_picker = 1
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
let g:rnvimr_enable_bw = 1
let g:rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1"'
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-s>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': float2nr(round(1.0 * &columns)),
            \ 'height': float2nr(round(0.5 * &lines)),
            \ 'col': float2nr(round(0.0 * &columns)),
            \ 'row': float2nr(round(0.47 * &lines)),
            \ 'style': 'minimal'
            \ }
let g:which_key_map =  {
            \ 'q' : 'Quit',
            \ 'w' : 'Write',
            \ 'd' : 'Delete',
            \ 'i' : 'dIr',
            \ 'r' : 'Ranger',
            \ 'c' : 'Comment',
            \ 'u' : 'URL',
            \ }
let g:which_key_map['b'] = { 'name' : '+Buffer',
            \ 'n' : 'New',
            \ 's' : 'Split',
            \ 'v' : 'Vertical',
            \ 'o' : 'One',
            \ 'r' : 'Rotate',
            \ 'e' : 'Edit',
            \ 'd' : 'Default',
            \ }
let g:which_key_map['f'] = { 'name' : '+Fzf',
            \ 'f' : 'Files',
            \ 'l' : 'Lines',
            \ 'c' : 'Commits',
            \ }
let g:which_key_map[' '] = { 'name' : '+Easymotion',
            \ 'h' : 'wHole',
            \ 'j' : 'Jump',
            \ 'k' : 'Kump',
            \ }
let g:which_key_map['h'] = { 'name' : '+Hunk',
            \ 'j' : 'Jump',
            \ 'k' : 'Kump',
            \ 'p' : 'Preview',
            \ 's' : 'Stage',
            \ 'u' : 'Undo',
            \ }
let g:which_key_map['a'] = { 'name' : '+Ale',
            \ 'j' : 'Jump',
            \ 'k' : 'Kump',
            \ }
let g:which_key_map['v'] = { 'name' : '+View',
            \ 'g' : 'Goyo',
            \ 'w' : 'Wrap',
            \ 'p' : 'sPell',
            \ 's' : 'Search',
            \ 'l' : 'Longline',
            \ 'q' : 'sQish',
            \ }
let g:which_key_map['x'] = { 'name' : '+eXecute',
            \ 'c' : 'Comp',
            \ 'o' : 'Opout',
            \ }
let g:which_key_map['s'] = { 'name' : '+Surround',
            \ 's' : 'Surround',
            \ 'c' : 'Change',
            \ 'd' : 'Delete',
            \ }
call which_key#register('<Space>', 'g:which_key_map')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" not mapped
nnoremap <C-h> <C-W><C-<>
nnoremap <C-l> <C-W><C->>
nnoremap <C-j> <C-W><C-->
nnoremap <C-k> <C-W><C-+>
nnoremap <S-h> <C-W><C-H>
nnoremap <S-k> <C-W><C-K>
nnoremap <S-j> <C-W><C-J>
nnoremap <S-l> <C-W><C-L>
nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent><localleader> :<c-u>WhichKey ','<CR>
nmap <C-p> :-r!xclip -o -sel clip<CR>
vmap <C-y> :!xclip -f -sel clip<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

" main menu
nnoremap <leader>q :quit<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>i :call <SID>switch_dir()<CR>
nnoremap <leader>r :RnvimrToggle<CR>
nmap <leader>c gcc<CR>
vmap <leader>c gc<CR>
map <leader>u <esc>gx<CR>

" Buffer menu
nnoremap <leader>bn :enew<bar> :Startify<CR>
nnoremap <leader>bs :new<bar> :Startify<CR>
nnoremap <leader>bv :vnew<bar> :Startify<CR>
nnoremap <leader>bo :wincmd o<CR>
nnoremap <leader>br :wincmd r<CR>
nnoremap <leader>be :call <SID>switch_edit()<CR>
nnoremap <leader>bd :wincmd =<CR>

" Fzf menu
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fc :Commits<CR>

" Easymotion menu
nmap <leader><space>h <Plug>(easymotion-bd-w)
nmap <leader><space>j <Plug>(easymotion-j)
nmap <leader><space>k <Plug>(easymotion-k)

" Gitgutter menu
nmap <leader>hj <Plug>(GitGutterNextHunk)
nmap <leader>hk <Plug>(GitGutterPrevHunk)

" Ale menu
nmap <leader>aj <Plug>(ale_next_wrap)
nmap <leader>ak <Plug>(ale_previous_wrap)

" View menu
nnoremap <leader>vg :Goyo<CR>
nnoremap <leader>vw :setlocal nowrap!<CR>
nnoremap <leader>vp :setlocal spell! spelllang=en_us<CR>
nnoremap <leader>vs :set hlsearch! hlsearch?<CR>
nnoremap <leader>vl :call <SID>long_line()<CR>
nnoremap <leader>vq <esc>ggVGgq<CR>

" eXecute menu
nnoremap <leader>xc :w! \| !comp <c-r>%<CR><CR>
nnoremap <leader>xo :!opout <c-r>%<CR><CR>

" Surround menu
map <leader>ss <esc>ysiw
map <leader>sc <esc>cs
map <leader>sd <esc>ds


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


function! s:long_line()
    if (g:longline ==? 'none')
        let g:longline = 'all'
        :setlocal virtualedit=all
    else
        let g:longline = 'none'
        :setlocal virtualedit=
    endif
endfunction


function! s:switch_dir()
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


function! s:switch_edit()
    if (g:switchedit ==? 'horizontal')
        let g:switchedit = 'vertical'
        :wincmd H
    else
        let g:switchedit = 'horizontal'
        :wincmd K
    endif
endfunction


function! s:goyo_enter()
    set showmode
    set showcmd
    Limelight
endfunction


function! s:goyo_leave()
    set noshowmode
    set noshowcmd
    set nocursorline
    :hi Normal ctermbg=NONE
    Limelight!
endfunction

