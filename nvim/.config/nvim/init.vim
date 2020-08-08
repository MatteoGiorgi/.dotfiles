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
"    vim-plug                https://github.com/junegunn/vim-plug
"    rnvimr                  https://github.com/kevinhwang91/rnvimr
"    vim-airline             https://github.com/vim-airline/vim-airline
"    vim-airline-themes      https://github.com/vim-airline/vim-airline-themes
"    vim-startify            https://github.com/mhinz/vim-startify
"    vim-fugitive            https://github.com/tpope/vim-fugitive
"    fzf                     https://github.com/junegunn/fzf.vim
"    ale                     https://github.com/dense-analysis/ale
"    supertab                https://github.com/ervandew/supertab
"    auto-pairs              https://github.com/jiangmiao/auto-pairs
"    vim-surround            https://github.com/tpope/vim-surround
"    vim-multiple-cursors    https://github.com/terryma/vim-multiple-cursors
"    vim-easymotion          https://github.com/easymotion/vim-easymotion
"    vim-commentary          https://github.com/tpope/vim-commentary
"    vim-gitgutter           https://github.com/airblade/vim-gitgutter
"    vim-whitch-key          https://github.com/liuchengxu/vim-which-key
"    vimwiki                 https://github.com/vimwiki/vimwiki
"    goyo.vim                https://github.com/junegunn/goyo.vim
"    limelight.vim           https://github.com/junegunn/limelight.vim
"    vim-devicons            https://github.com/ryanoasis/vim-devicons


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo 'Downloading junegunn/vim-plug to manage plugins...'
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" >
                \ ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
    Plug 'kevinhwang91/rnvimr'
    Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
    Plug 'mhinz/vim-startify'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf.vim'
    Plug 'dense-analysis/ale'
    Plug 'ervandew/supertab'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-commentary'
    Plug 'airblade/vim-gitgutter'
    Plug 'liuchengxu/vim-which-key'
    Plug 'vimwiki/vimwiki'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'ryanoasis/vim-devicons'
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


syntax on
color spacegray
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

highlight Normal ctermbg=NONE
highlight link RnvimrNormal CursorLine
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set clipboard=unnamedplus
set number relativenumber
set mouse=a
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set omnifunc=syntaxcomplete#Complete
set hlsearch
set colorcolumn=81
set wrap
set textwidth=80
set linebreak
set wildmenu
set wildmode=list:longest,list:full
set encoding=UTF-8
set nobackup
set noshowmode
set noshowcmd
set nocursorline
set noerrorbells
set timeoutlen=500


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:mapleader = "\<space>"
let g:maplocalleader = ','
let g:netrw_browsex_viewer= 'xdg-open'
let g:switchedit = 'horizontal'
let g:switchdir = 'home'
let g:longline = 'none'
let g:SuperTabDefaultCompletionType = 'context'
let g:ale_completion_enabled = 1
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:goyo_width=100
let g:goyo_height='80%'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_grayscale'
let g:limelight_conceal_ctermfg = 240
let g:startify_files_number = 5
let g:startify_list_order = [
            \ ['   Files:'], 'files',
            \ ['   Dir:'], 'dir',
            \ ['   Sessions:'], 'sessions',
            \ ['   Bookmarks:'], 'bookmarks',
            \ ]
let g:startify_bookmarks = [
            \ '~/.vimrc',
            \ '~/.zshrc',
            \ '~/.bashrc',
            \ '~/.config/qtile/config.py',
            \ '~/.config/nvim/init.vim'
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
let g:vimwiki_list = [{'path': '~/vimwiki/',
            \ 'syntax': 'default', 'ext': '.wiki'}]
let g:which_key_map =  {}
let g:which_key_map['space'] = { 'name' : '+leader' ,
            \ 'd' : [':bdelete<CR>',                         '???'],
            \ 'o' : [':wincmd o<CR>',                        '???'],
            \ 'n' : [':enew<bar> :Startify<CR>',             '???'],
            \ 's' : [':new<bar> :Startify<CR>',              '???'],
            \ 'v' : [':vnew<bar> :Startify<CR>',             '???'],
            \ 'q' : [':quit<CR>',                            '???'],
            \ 'z' : [':write<CR>',                           '???'],
            \ 't' : [':terminal<CR>',                        '???'],
            \ 'f' : [':RnvimrToggle<CR>',                    '???'],
            \ 'h' : [':Files<CR>',                           '???'],
            \ 'l' : [':BLines<CR>',                          '???'],
            \ 'g' : [':Commits<CR>',                         '???'],
            \ 'y' : [':Goyo<CR>',                            '???'],
            \ 'p' : [':setlocal nowrap!<CR>',                '???'],
            \ 'r' : [':wincmd r<CR>',                        '???'],
            \ 'e' : [':call <SID>switch_edit()<CR>',         '???'],
            \ 'i' : [':call <SID>switch_dir()<CR>',          '???'],
            \ '0' : [':wincmd =<CR>',                        '???'],
            \ '1' : [':w! \| !comp <c-r>%<CR><CR>',          '???'],
            \ '2' : [':!opout <c-r>%<CR><CR>',               '???'],
            \ '3' : [':set hlsearch! hlsearch?<CR>',         '???'],
            \ '4' : [':setlocal spell! spelllang=en_us<CR>', '???'],
            \ '5' : [':call <SID>long_line()<CR>',           '???'],
            \ '6' : ['<esc>ggVGgq<CR>',                      '???'],
            \ 'u' : ['<esc>gx<CR>',                          '???'],
            \ 'j' : ['<Plug>(easymotion-j)',                 '???'],
            \ 'k' : ['<Plug>(easymotion-k)',                 '???'],
            \ 'c' : ['gcc<CR>',                              '???'],
            \ }
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
            \ 'style': 'minimal' }
let g:rnvimr_presets = [
            \ {},
            \ {'width': 0.700, 'height': 0.700},
            \ {'width': 0.800, 'height': 0.800},
            \ {'width': 0.950, 'height': 0.950},
            \ {'width': 0.500, 'height': 0.500, 'col': 0, 'row': 0},
            \ {'width': 0.500, 'height': 0.500, 'col': 0, 'row': 0.5},
            \ {'width': 0.500, 'height': 0.500, 'col': 0.5, 'row': 0},
            \ {'width': 0.500, 'height': 0.500, 'col': 0.5, 'row': 0.5},
            \ {'width': 0.500, 'height': 1.000, 'col': 0, 'row': 0},
            \ {'width': 0.500, 'height': 1.000, 'col': 0.5, 'row': 0},
            \ {'width': 1.000, 'height': 0.500, 'col': 0, 'row': 0},
            \ {'width': 1.000, 'height': 0.500, 'col': 0, 'row': 0.5}]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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
nnoremap <leader>n :bnext<CR>
nnoremap <leader>m :bprev<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>o :wincmd o<CR>
nnoremap <leader>b :enew<bar> :Startify<CR>
nnoremap <leader>s :new<bar> :Startify<CR>
nnoremap <leader>v :vnew<bar> :Startify<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>a :write<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>g :Commits<CR>
nnoremap <leader>y :Goyo<CR>
nnoremap <leader>p :setlocal nowrap!<CR>
nnoremap <leader>r :wincmd r<CR>
nnoremap <leader>e :call <SID>switch_edit()<CR>
nnoremap <leader>i :call <SID>switch_dir()<CR>
nnoremap <leader>0 :wincmd =<CR>
nnoremap <leader>1 :w! \| !comp <c-r>%<CR><CR>
nnoremap <leader>2 :!opout <c-r>%<CR><CR>
nnoremap <leader>3 :set hlsearch! hlsearch?<CR>
nnoremap <leader>4 :setlocal spell! spelllang=en_us<CR>
nnoremap <leader>5 :call <SID>long_line()<CR>
nnoremap <leader>6 <esc>ggVGgq<CR>

nnoremap <leader>h :RnvimrToggle<CR>
tnoremap <leader>h <C-\><C-n>:RnvimrResize<CR>

map <leader>u <esc>gx<CR>

nmap <leader><leader> <Plug>(easymotion-bd-w)
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)

nmap <leader>x <Plug>(GitGutterNextHunk)
nmap <leader>z <Plug>(GitGutterPrevHunk)

nmap <leader>c gcc<CR>
vmap <leader>c gc<CR>

nmap <C-p> :-r!xclip -o -sel clip<CR>
vmap <C-y> :!xclip -f -sel clip<CR>


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
    set cursorline
    Limelight
endfunction


function! s:goyo_leave()
    set noshowmode
    set noshowcmd
    set nocursorline
    :hi Normal ctermbg=NONE
    Limelight!
endfunction

