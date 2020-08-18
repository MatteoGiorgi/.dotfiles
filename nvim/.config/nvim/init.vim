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
"    vim-plug                  https://github.com/junegunn/vim-plug
"    ale                       https://github.com/dense-analysis/ale
"    coc                       https://github.com/neoclide/coc.nvim
"    supertab                  https://github.com/ervandew/supertab
"    rnvimr                    https://github.com/kevinhwang91/rnvimr
"    vim-airline               https://github.com/matteogiorgi/vim-airline
"    vim-startify              https://github.com/mhinz/vim-startify
"    vim-fugitive              https://github.com/tpope/vim-fugitive
"    fzf                       https://github.com/junegunn/fzf.vim
"    auto-pairs                https://github.com/jiangmiao/auto-pairs
"    vim-surround              https://github.com/tpope/vim-surround
"    vim-repeat                https://github.com/tpope/vim-repeat
"    vim-multiple-cursors      https://github.com/terryma/vim-multiple-cursors
"    vim-easymotion            https://github.com/easymotion/vim-easymotion
"    vim-commentary            https://github.com/tpope/vim-commentary
"    vim-gitgutter             https://github.com/airblade/vim-gitgutter
"    vim-which-key             https://github.com/liuchengxu/vim-which-key
"    goyo                      https://github.com/junegunn/goyo.vim
"    limelight                 https://github.com/junegunn/limelight.vim
"    vim-pandoc                https://github.com/vim-pandoc/vim-pandoc
"    vim-pandoc-syntax         https://github.com/vim-pandoc/vim-pandoc-syntax
"    markdown-preview          https://github.com/iamcco/markdown-preview.nvim
"    vim-table-mode            https://github.com/dhruvasagar/vim-table-mode
"    vimtex                    https://github.com/lervag/vimtex
"    vim-latex-live-preview    https://github.com/xuhdev/vim-latex-live-preview
"    vim-css-color             https://github.com/ap/vim-css-color
"    dracula                   https://github.com/dracula/vim/
"    vim-devicons              https://github.com/ryanoasis/vim-devicons


"                           COC EXTENSIONS
"                     [ :CocInstall plugin-name ]
"
"    coc-marketplace           https://github.com/fannheyward/coc-marketplace
"    coc-vimtex                https://github.com/neoclide/coc-vimtex
"    coc-vimlsp                https://github.com/iamcco/coc-vimlsp
"    coc-clang                 https://github.com/clangd/coc-clangd
"    coc-sh                    https://github.com/josa42/coc-sh
"    coc-python                https://github.com/neoclide/coc-python
"    coc-java                  https://github.com/neoclide/coc-java
"    coc-html                  https://github.com/neoclide/coc-html




"VIM_PLUG_______________________________________________________________________

autocmd VimEnter *
            \ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) |
            \     PlugInstall --sync | q |
            \ endif

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
    Plug 'matteogiorgi/vim-airline'
    Plug 'mhinz/vim-startify'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-commentary'
    Plug 'airblade/vim-gitgutter'
    Plug 'liuchengxu/vim-which-key'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'lervag/vimtex'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    Plug 'ap/vim-css-color'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'ryanoasis/vim-devicons'
call plug#end()




"SETTINGS_______________________________________________________________________

syntax on
color dracula
filetype plugin indent on

highlight Normal ctermbg=NONE
highlight GitGutterAdd ctermfg=Green
highlight GitGutterChange ctermfg=Yellow
highlight GitGutterDelete ctermfg=Red
highlight link RnvimrNormal CursorLine

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

set clipboard=unnamedplus
set number relativenumber
set mouse=a
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set hlsearch
set colorcolumn=81
set wrap
set linebreak
set textwidth=80
set wrapmargin=80
set formatoptions+=l
set splitbelow
set splitright
set smartcase
set encoding=UTF-8
set nobackup
set noshowmode
set noshowcmd
set nocursorline
set noerrorbells
set nofoldenable
set foldmethod=manual
set nospell
set timeoutlen=500
set updatetime=500


" unfortunatelly Limelight can't calculate background with truecolors enabled
"
" if (has('nvim'))
"     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" endif




"MY_VARIABLES___________________________________________________________________

let g:mapleader = "\<space>"
let g:maplocalleader = ','
let g:netrw_browsex_viewer = 'xdg-open'
let g:switchedit = 'horizontal'
let g:switchdir = 'local'
let g:longline = 'none'




"ALE____________________________________________________________________________

let g:ale_linters = {
            \ 'c': ['gcc'],
            \ 'python': ['flake8', 'pylint'],
            \ 'javascript': ['eslint'],
            \}
let g:ale_fixers = {
            \ 'python': ['yapf'],
            \}
let g:ale_fix_on_save = 1




"VIMTEX_&_LATEXPREVIEW__________________________________________________________

let g:tex_flavor = 'latex'
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'xelatex'




"PANDOC_&_MDPREVIEW_____________________________________________________________

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'vimb'
let g:mkdp_echo_preview_url = 1
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1,
            \ 'sequence_diagrams': {},
            \ 'flowchart_diagrams': {},
            \ 'content_editable': v:false
            \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'




"EASYMOTION_____________________________________________________________________

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1




"SUPERTAB_______________________________________________________________________

let g:SuperTabDefaultCompletionType = 'context'




"GOYO_&_LIMELIGHT_______________________________________________________________

let g:goyo_width = 100
let g:goyo_height = '80%'
let g:limelight_conceal_ctermfg = 'darkgray'




"AIRLINE________________________________________________________________________

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'minimalist'




"STARTIFY_______________________________________________________________________

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




"RNVIMR_________________________________________________________________________

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
            \ 'row': float2nr(round(0.46 * &lines)),
            \ 'style': 'minimal'
            \ }




"WHICHKEY_&_KEYMAPPINGS_________________________________________________________

" not mapped
nnoremap <M-S-h> <C-W><C-<>
nnoremap <M-S-l> <C-W><C->>
nnoremap <M-S-j> <C-W><C-->
nnoremap <M-S-k> <C-W><C-+>
nnoremap <M-h> <C-W><C-H>
nnoremap <M-k> <C-W><C-K>
nnoremap <M-j> <C-W><C-J>
nnoremap <M-l> <C-W><C-L>
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
nnoremap <C-h> {
nnoremap <C-l> }
nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent><localleader> :<c-u>WhichKey ','<CR>
nmap <C-p> :-r!xclip -o -sel clip<CR>
vmap <C-y> :!xclip -f -sel clip<CR>
vmap <Tab> >gv
vmap <S-Tab> <gv
nnoremap <M-Tab> :bnext<CR>
nnoremap <M-Backspace> :bprev<CR>

" main menu
nnoremap <leader>q :quit<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>i :call <SID>switch_dir()<CR>
nnoremap <leader>r :RnvimrToggle<CR>
nnoremap <leader>g :Goyo<CR>
nmap <leader>x :LLPStartPreview<CR>
map <leader>u <esc>gx<CR>
nmap <leader>l gcc<CR>
vmap <leader>l gc<CR>
" remember to check ad set the default web-browser with:
" xdg-settings get default-web-browser
" xdg-settings set default-web-browser brave-browser.desktop

" add support to a plugin for vim-repeat whit the following command:
" silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
let g:which_key_map =  {
            \ 'q' : 'Quit',
            \ 'w' : 'Write',
            \ 'd' : 'Delete',
            \ 'i' : 'dIr',
            \ 'l' : 'LineComment',
            \ 'r' : 'Ranger',
            \ 'g' : 'Goyo',
            \ 'x' : 'lateX',
            \ 'u' : 'Url',
            \ }

" Buffer menu
nnoremap <leader>bn :enew<bar> :Startify<CR>
nnoremap <leader>bs :new<bar> :Startify<CR>
nnoremap <leader>bv :vnew<bar> :Startify<CR>
nnoremap <leader>bo :wincmd o<CR>
nnoremap <leader>br :wincmd r<CR>
nnoremap <leader>bc :call <SID>switch_edit()<CR>
nnoremap <leader>b0 :wincmd =<CR>
let g:which_key_map['b'] = { 'name' : '+Buffer',
            \ 'n' : 'New',
            \ 's' : 'Split',
            \ 'v' : 'Vertical',
            \ 'o' : 'OnlyOne',
            \ 'r' : 'Rotate',
            \ 'c' : 'splitChange',
            \ '0' : '50-50',
            \ }

" Fzf menu
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fj :Buffers<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fc :Commits<CR>
let g:which_key_map['f'] = { 'name' : '+Fzf',
            \ 'f' : 'Files',
            \ 'j' : 'Jumpbuffer',
            \ 'h' : 'History',
            \ 'l' : 'Lines',
            \ 'c' : 'Commits',
            \ }

" Easymotion menu
nmap <leader><space>h <Plug>(easymotion-bd-w)
nmap <leader><space>j <Plug>(easymotion-j)
nmap <leader><space>k <Plug>(easymotion-k)
let g:which_key_map[' '] = { 'name' : '+Easymotion',
            \ 'h' : 'wHole',
            \ 'j' : 'Jump',
            \ 'k' : 'Kump',
            \ }

" Gitgutter menu
nmap <leader>hj <Plug>(GitGutterNextHunk)
nmap <leader>hk <Plug>(GitGutterPrevHunk)
let g:which_key_map['h'] = { 'name' : '+Hunk',
            \ 'j' : 'Jump',
            \ 'k' : 'Kump',
            \ 'p' : 'Preview',
            \ 's' : 'Stage',
            \ 'u' : 'Undo',
            \ }

" Ale menu
nmap <leader>aj <Plug>(ale_next_wrap)
nmap <leader>ak <Plug>(ale_previous_wrap)
let g:which_key_map['a'] = { 'name' : '+Ale',
            \ 'j' : 'Jump',
            \ 'k' : 'Kump',
            \ }

" View menu
nnoremap <leader>vw :setlocal nowrap!<CR>
nnoremap <leader>vp :setlocal spell! spelllang=en_us<CR>
nnoremap <leader>vs :set hlsearch! hlsearch?<CR>
nnoremap <leader>vl :call <SID>long_line()<CR>
nnoremap <leader>vq <esc>ggVGgq<CR>
let g:which_key_map['v'] = { 'name' : '+View',
            \ 'w' : 'lineWrap',
            \ 'p' : 'sPellcheck',
            \ 's' : 'Search',
            \ 'l' : 'Longline',
            \ 'q' : 'sQish',
            \ }

" Execute menu
nnoremap <leader>ec :w! \| !comp <c-r>%<CR><CR>
nnoremap <leader>eo :!opout <c-r>%<CR><CR>
let g:which_key_map['e'] = { 'name' : '+Execute',
            \ 'c' : 'Comp',
            \ 'o' : 'Opout',
            \ }

" Surround menu
map <leader>sw <esc>ysiw
map <leader>sc <esc>cs
map <leader>sd <esc>ds
let g:which_key_map['s'] = { 'name' : '+Surround',
            \ 'w' : 'Word',
            \ 'c' : 'Change',
            \ 'd' : 'Delete',
            \ }

" Markdown menu
nmap <leader>ma <Plug>MarkdownPreview
nmap <leader>md <Plug>MarkdownPreviewStop
nmap <leader>mt <Plug>MarkdownPreviewToggle
let g:which_key_map['m'] = { 'name' : '+Markdown',
            \ 'a' : 'Activate',
            \ 'd' : 'Deactivate',
            \ 't' : 'Toggle',
            \ }

" Markdown menu
let g:which_key_map['t'] = { 'name' : '+Table',
            \ 'm' : 'tableMode',
            \ 't' : 'Tableize',
            \ 'r' : 'Realign',
            \ 's' : 'Sort',
            \ '?' : 'echocell?',
            \ }

call which_key#register('<Space>', 'g:which_key_map')




"FUNCTIONS______________________________________________________________________

function! GetExtension()
    let ext = expand('%:e')
    if (ext ==? 'py')
        return 'python'
    elseif (ext ==? 'hs')
        return 'ghci'
    elseif (ext ==? 'ml')
        return 'ocaml'
    elseif (ext ==? 'r')
        return 'R'
    elseif (ext ==? 'js')
        return 'node'
    endif
endfunction


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
    Limelight!
    hi Normal ctermbg=NONE
endfunction

