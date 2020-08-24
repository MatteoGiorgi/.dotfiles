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
"    floaterm                  https://github.com/voldikss/vim-floaterm
"    vim-airline               https://github.com/matteogiorgi/vim-airline
"    vim-startify              https://github.com/mhinz/vim-startify
"    vim-fugitive              https://github.com/tpope/vim-fugitive
"    fzf                       https://github.com/junegunn/fzf
"    fzf.vim                   https://github.com/junegunn/fzf.vim
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
"    vimwiki                   https://github.com/vimwiki/vimwiki
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
"    coc-xml                   https://github.com/fannheyward/coc-xml




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
    Plug 'voldikss/vim-floaterm'
    Plug 'matteogiorgi/vim-airline'
    Plug 'mhinz/vim-startify'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
    Plug 'vimwiki/vimwiki'
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
set timeoutlen=000
set updatetime=500




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
let g:ale_disable_lsp = 1
let g:airline#extensions#ale#enabled = 1




"VIMTEX_&_LATEXPREVIEW__________________________________________________________

let g:tex_flavor = 'latex'
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'xelatex'




"VIMWIKI________________________________________________________________________

let g:vimwiki_global_ext = 0




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
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'minimalist'




"STARTIFY_______________________________________________________________________

let g:startify_files_number = 5
let g:startify_list_order = [
            \ ['   Files:'], 'files',
            \ ['   Directory:'], 'dir',
            \ ['   Sessions:'], 'sessions',
            \ ['   Bookmarks:'], 'bookmarks',
            \ ]
let g:startify_bookmarks = [
            \ '~/',
            \ '~/.dotfiles/',
            \ ]
let g:startify_custom_indices = [
            \ 'a', 'b', 'c', 'd', 'f', 'g', 'h', 'i', 'l', 'm', 'n',
            \ 'o', 'p', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'x'
            \ ]
let g:startify_session_dir = '~/.config/nvim/sessions'
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




"FLOATERM_______________________________________________________________________

let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1




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
            \ 'col': float2nr(round(0.00 * &columns)),
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
nnoremap <C-j> <C-d> zz
nnoremap <C-k> <C-u> zz
nnoremap <S-j> }}{ zz
nnoremap <S-k> {{ zz
nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent><leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent><localleader> :<c-u>WhichKey ','<CR>
vnoremap <silent><localleader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <M-Tab> :bnext<CR>
nnoremap <M-Backspace> :bprev<CR>
nnoremap <M-space> :RnvimrToggle<CR>
tnoremap <M-space> <C-\><C-n>:RnvimrToggle<CR>
nnoremap <M-return> :FloatermToggle<CR>
tnoremap <M-return> <C-\><C-n>:FloatermToggle<CR>

nmap <C-p> :-r!xclip -o -sel clip<CR>
vmap <C-y> :!xclip -f -sel clip<CR>
vmap <Tab> >gv
vmap <S-Tab> <gv


" Leader menu
nnoremap <leader>q :quit<CR>
nnoremap <leader>z :write<CR>
nnoremap <leader>k :bdelete<CR>
nnoremap <leader>r :wincmd r<CR>
nnoremap <leader>i :call <SID>switch_edit()<CR>
nnoremap <leader>d :call <SID>switch_dir()<CR>
nnoremap <leader>0 :wincmd =<CR>
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
            \ 'q' : 'Quit-split',
            \ 'z' : 'Save-buffer',
            \ 'k' : 'Kill-buffer',
            \ 'r' : 'Rotate-splits',
            \ 'i' : 'Invert-layout',
            \ 'd' : 'Directory-swap',
            \ '0' : '50-50',
            \ 'g' : 'Goyo-distractionfree',
            \ 'x' : 'Xtex-preview',
            \ 'u' : 'Url-undercursor',
            \ 'l' : 'Line-comment',
            \ }

" New-buffer menu
nnoremap <leader>nn :enew<bar> :Startify<CR>
nnoremap <leader>nk :new<bar> :Startify<CR>
nnoremap <leader>nj :belowright split<bar> :Startify<CR>
nnoremap <leader>nh :vnew<bar> :Startify<CR>
nnoremap <leader>nl :belowright vsplit<bar> :Startify<CR>
let g:which_key_map['n'] = { 'name' : '+New-buffer',
            \ 'n' : 'New',
            \ 'j' : 'Split-down',
            \ 'k' : 'Split-up',
            \ 'h' : 'Split-left',
            \ 'l' : 'Split-right',
            \ }

" Only-one menu
nnoremap <leader>os :only<CR>
nnoremap <leader>ob :%bdelete<bar> edit #<bar> normal `"<CR>
let g:which_key_map['o'] = { 'name' : '+Only-one',
            \ 's' : 'Split',
            \ 'b' : 'Buffer',
            \ }

" Sessions menu
nnoremap <leader>sl :SLoad<CR>
nnoremap <leader>ss :SSave<CR>
nnoremap <leader>sd :SDelete<CR>
nnoremap <leader>sq :SClose<CR>
let g:which_key_map['s'] = { 'name' : '+Sessions',
            \ 'l' : 'Load',
            \ 's' : 'Save',
            \ 'd' : 'Delete',
            \ 'q' : 'Quit',
            \ }

" Fzf menu
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fr :GFiles<CR>
nnoremap <leader>fs :GFiles?<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>fj :BCommits<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fk :BLines<CR>
let g:which_key_map['f'] = { 'name' : '+Fzf',
            \ 'f' : 'Files',
            \ 'r' : 'Repo',
            \ 's' : 'Status',
            \ 'c' : 'Commits-repo',
            \ 'j' : 'Commits-buffer',
            \ 'b' : 'Buffers',
            \ 'h' : 'History',
            \ 'l' : 'Lines',
            \ 'k' : 'Lines-buffer',
            \ }

" Coc menu
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>cr <Plug>(coc-references)
let g:which_key_map['c'] = { 'name' : '+Coc',
            \ 'd' : 'Definitions',
            \ 'r' : 'References',
            \ }

" Easymotion menu
nmap <leader><space>h <Plug>(easymotion-linebackward)
nmap <leader><space>l <Plug>(easymotion-lineforward)
nmap <leader><space>k <Plug>(easymotion-k)
nmap <leader><space>j <Plug>(easymotion-j)
let g:which_key_map[' '] = { 'name' : '+Easymotion',
            \ 'h' : 'Line-backward',
            \ 'l' : 'Line-forward',
            \ 'k' : 'Lines-above',
            \ 'j' : 'Lines-below',
            \ }

" Hunk-gitgutter menu
nmap <leader>hj <Plug>(GitGutterNextHunk)<bar> 'zz
nmap <leader>hk <Plug>(GitGutterPrevHunk)<bar> 'zz
let g:which_key_map['h'] = { 'name' : '+Hunk-gitgutter',
            \ 'j' : 'Next-hunk',
            \ 'k' : 'Previous-hunk',
            \ 'p' : 'Preview',
            \ 's' : 'Stage',
            \ 'u' : 'Undo',
            \ }

" Ale menu
nmap <leader>aj <Plug>(ale_next_wrap)<bar> 'zz
nmap <leader>ak <Plug>(ale_previous_wrap)<bar> 'zz
let g:which_key_map['a'] = { 'name' : '+Ale',
            \ 'j' : 'Next-error',
            \ 'k' : 'Previous-error',
            \ }

" Surround menu
map <leader>jj <esc>ysiw
vmap <leader>jj <S-s>
map <leader>js <esc>cs
map <leader>jd <esc>ds
let g:which_key_map['j'] = { 'name' : '+Surround',
            \ 'j' : 'Word/Block',
            \ 's' : 'Substitute',
            \ 'd' : 'Delete',
            \ }

" Markdown-preview menu
nmap <leader>ma <Plug>MarkdownPreview
nmap <leader>md <Plug>MarkdownPreviewStop
nmap <leader>mt <Plug>MarkdownPreviewToggle
let g:which_key_map['m'] = { 'name' : '+Markdown-preview',
            \ 'a' : 'Activate-preview',
            \ 'd' : 'Deactivate-preview',
            \ 't' : 'Toggle-preview',
            \ }

" Vinwiki menu
let g:which_key_map['w'] = { 'name' : '+Vimwiki',
            \ 'w' : 'Index-buffer',
            \ 't' : 'Index-tab',
            \ 's' : 'Index-select',
            \ 'i' : 'Diary-index',
            \ 'd' : 'Delete',
            \ 'r' : 'Rename',
            \ }

" Tablemode menu
let g:which_key_map['t'] = { 'name' : '+Tablemode',
            \ 'm' : 'Mode-toggle',
            \ 't' : 'Tableize',
            \ 'r' : 'Realign',
            \ 's' : 'Sort',
            \ '?' : 'echocell?',
            \ }

" View-options menu
nnoremap <leader>vw :setlocal nowrap!<CR>
nnoremap <leader>vs :setlocal spell! spelllang=en_us<CR>
nnoremap <leader>vh :set hlsearch! hlsearch?<CR>
nnoremap <leader>vl :call <SID>long_line()<CR>
nnoremap <leader>v8 <esc>ggVGgq<CR>
let g:which_key_map['v'] = { 'name' : '+View-options',
            \ 'w' : 'Wrap-line',
            \ 's' : 'Spelling-check',
            \ 'h' : 'Highlight-search',
            \ 'l' : 'Long-line',
            \ '8' : '80-char',
            \ }

" Execute menu
nnoremap <leader>e1 :w! \| !comp <c-r>%<CR><CR>
nnoremap <leader>e2 :!opout <c-r>%<CR><CR>
let g:which_key_map['e'] = { 'name' : '+Execute-scripts',
            \ '1' : 'Comp',
            \ '2' : 'Opout',
            \ }

call which_key#register('<Space>', 'g:which_key_map')




"FUNCTIONS______________________________________________________________________

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
    set nonumber norelativenumber
    set showmode
    set showcmd
    Limelight
endfunction


function! s:goyo_leave()
    set number relativenumber
    set noshowmode
    set noshowcmd
    set nocursorline
    Limelight!
    hi Normal ctermbg=NONE
endfunction


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

