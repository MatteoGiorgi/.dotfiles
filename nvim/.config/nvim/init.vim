
"                   ██▄   █   ██▒   █▓ ██▓ ███▄ ▄███▓
"                  ██▒▀█▄ ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
"                  ██   ▀███░ ▓██  █▒░▒██▒▓██    ▓██░
"                  ██    ▒██▒  ▒██ █░░░██░▒██    ▒██
"                   █▒   ░█ ▒   ▒▀█░  ░██░▒██▒   ░██▒
"                   ▒░   ░  ░   ░ ▐░  ░▓  ░ ▒░   ░  ░
"                    ░      ░   ░ ░░   ▒ ░░  ░      ░
"                    ░            ░░   ▒ ░░      ░
"                                  ░   ░         ░
"                                 ░


"                            VIM EXTENSIONS
"                    [ Plug 'repo-name/plugin-name' ]
"
"    vim-plug                  https://github.com/junegunn/vim-plug
"    ale                       https://github.com/dense-analysis/ale
"    vim-polyglot              https://github.com/sheerun/vim-polyglot
"    vimcompletesme            https://github.com/ajh17/VimCompletesMe
"    clever-f                  https://github.com/rhysd/clever-f.vim
"    auto-pairs                https://github.com/jiangmiao/auto-pairs
"    vim-surround (+ repeat)   https://github.com/tpope/vim-surround
"    vim-commentary            https://github.com/tpope/vim-commentary
"    vim-fugitive (+ gv)       https://github.com/tpope/vim-fugitive
"    vim-clap                  https://github.com/liuchengxu/vim-clap
"    undotree                  https://github.com/mbbill/undotree
"    vim-buftabline            https://github.com/ap/vim-buftabline
"    dashboard-nvim            https://github.com/glepnir/dashboard-nvim
"    vim-which-key             https://github.com/liuchengxu/vim-which-key
"    vimwiki                   https://github.com/vimwiki/vimwiki




"VIM_PLUG_______________________________________________________________________

augroup vimenter
    autocmd VimEnter *
                \ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) |
                \     PlugInstall --sync | q |
                \ endif
    if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
        echo 'Downloading junegunn/vim-plug to manage plugins...'
        silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
        silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
        autocmd VimEnter * PlugInstall
    endif
augroup END

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
    Plug 'dense-analysis/ale'
    Plug 'sheerun/vim-polyglot'
    Plug 'ajh17/VimCompletesMe'
    Plug 'rhysd/clever-f.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive' | Plug 'junegunn/gv.vim'
    Plug 'liuchengxu/vim-clap'
    Plug 'mbbill/undotree'
    Plug 'ap/vim-buftabline'
    Plug 'glepnir/dashboard-nvim'
    Plug 'liuchengxu/vim-which-key'
    Plug 'vimwiki/vimwiki'
call plug#end()




"SETTINGS_______________________________________________________________________

syntax on
color quantum
filetype plugin indent on

set exrc
set guicursor=a:block-Cursor
set guicursor+=n-v:blinkon0
set guicursor+=c-i:blinkwait700-blinkon400-blinkoff250
set background=dark
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
set scrolloff=8
set signcolumn=auto:2
set showmode
set showcmd
set cmdheight=1
set nocursorline
set noerrorbells
set nofoldenable
set foldmethod=manual
set nospell
set omnifunc=ale#completion#OmniFunc  "syntaxcomplete#Complete
set complete+=k/usr/share/dict/british-english
set complete+=k/usr/share/dict/italian
set complete+=kspell
set matchpairs+=<:>
set completeopt=menuone,longest,preview
set shortmess+=c
set autochdir
set hidden
set guifont=UbuntuMono\ Nerd\ Font\ 10
set updatetime=100  "default = 4000ms
set timeoutlen=100  "default = 1000ms
set guioptions-=e
set showtabline=2
set laststatus=2
set statusline=
set statusline+=%{line#StatuslineGit()}
set statusline+=%f
set statusline+=%{line#BufferStatus()}
set statusline+=%=
set statusline+=%{line#LineInfo()}
set statusline+=\ \ \ \ \ \ \ \ \ \ %{line#LinterStatus()}


if exists('+termguicolors')
    set termguicolors
endif

if has('linebreak')
    let &showbreak='⤷ '
endif

if has('persistent_undo')
    set undodir=$HOME/.config/nvim/undodir
    set undofile
endif




"AUTOGROUPS_____________________________________________________________________

" Do stuff at exit
augroup vimleave
    autocmd!
    autocmd VimLeave call session#SaveLast()
augroup END


" Automatically change root directory
if g:root#auto == 1
    augroup root
        autocmd!
        execute 'autocmd BufEnter ' . g:root#autocmd_patterns . ' :Root'
    augroup END
endif


" Change linenumber behaviour in insert mode
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" Change cursorline colors in insert mode
augroup vimrc
    autocmd InsertEnter * set cursorline
    autocmd InsertLeave * set nocursorline
augroup END


" Netrw mappings
augroup netrw
    autocmd!
    autocmd Filetype netrw call maps#NetrwMapping()
augroup END


" Terminal windows settings
augroup termwin
    autocmd!
    autocmd TermOpen,BufWinEnter,WinEnter term://*h startinsert
    autocmd TermOpen,TermEnter term://*h call maps#TermMapping()
augroup END




"MY_VARIABLES___________________________________________________________________

let &colorcolumn = '81,'.join(range(81,999),',')
let g:mapleader = "\<space>"
let g:maplocalleader = ','




"NETRW__________________________________________________________________________


let g:netrw_banner = 0
let g:netrw_keepdir = 0
let g:netrw_liststyle = 4
let g:netrw_sort_options = 'i'
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_browsex_viewer = 'xdg-open'
let g:ghregex = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide = g:ghregex
let g:netrw_preview = 0
let g:netrw_alto = 0
let g:netrw_altv = 1




"ROOT___________________________________________________________________________

let g:root#auto = 0
let g:root#echo = 1
let g:root#patterns = [
            \ '.git',
            \ 'Makefile',
            \ 'makefile',
            \ 'build.gradle',
            \ 'Readme.md'
            \ ]




"VIMCOMPLETESME_________________________________________________________________

let b:vcm_tab_complete = 'omni'




"BUFTABLINE_____________________________________________________________________

let g:buftabline_show = 1
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1




"CLAP___________________________________________________________________________

let g:clap_always_open_preview = 1
let g:clap_search_box_border_style = 'nil'
let g:clap_enable_icon = 0
let g:clap_provider_grep_enable_icon = 0
let g:clap_preview_size = 5
let g:clap_enable_background_shadow = v:true
let g:clap_background_shadow_blend = 75
let g:clap_insert_mode_only = v:true
let g:clap_disable_run_rooter = v:true
let g:clap_project_root_markers = [
            \ '.root',
            \ '.git',
            \ '.git/'
            \ ]
let g:clap_layout = {
            \ 'relative': 'editor',
            \ 'width': '67%',
            \ 'height': '33%',
            \ 'row': '33%',
            \ 'col': '17%'
            \ }
let g:clap_provider_dotfiles = {
            \ 'source': [
                \ '~/.dotfiles',
                \ '~/.config/nvim/init.vim',
                \ '~/.vimrc',
                \ '~/.bashrc',
                \ '~/.zshrc'
                \ ],
            \ 'sink': 'e',
            \ 'description': 'Open some dotfile',
            \ }




"DASHBOARD______________________________________________________________________

let g:dashboard_default_executive ='clap'
let g:dashboard_session_directory = '~/.config/nvim/sessions'
let g:dashboard_custom_section={
            \ '0_marks': {
                \ 'description': ['  Open last                               SPC o'],
                \ 'command': 'OpenLast'
                \ },
            \ '1_marks': {
                \ 'description': ['  Marks                                   ░ ░ m'],
                \ 'command': function('dashboard#handler#book_marks')
                \ },
            \ '2_history': {
                \ 'description': ['  History                                 ░ ░ h'],
                \ 'command': 'Clap history'
                \ },
            \ '3_find': {
                \ 'description': ['  Find files                              ░ ░ f'],
                \ 'command': 'Clap files'
                \ },
            \ '4_edit': {
                \ 'description': ['  Edit new                                SPC e'],
                \ 'command': function('dashboard#handler#new_file')
                \ },
            \ '5_clap': {
                \ 'description': ['גּ  Clap <cmd>                              ░ ░ ░'],
                \ 'command': 'Clap '
                \ },
            \ }
let g:dashboard_custom_header = [
            \ ' =================     ===============     ===============   ========  ======== ',
            \ ' \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . // ',
            \ ' ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .|| ',
            \ ' || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . || ',
            \ ' ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .|| ',
            \ ' || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . || ',
            \ ' ||. . ||   ||-`  || ||  `-||   || . .|| ||. . ||   ||-`  || ||  `|\_ . .|. .|| ',
            \ ' || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . || ',
            \ ' ||_-` ||  .|/    || ||    \|.  || `-_|| ||_-` ||  .|/    || ||   | \  / |-_.|| ',
            \ ' ||    ||_-`      || ||      `-_||    || ||    ||_-`      || ||   | \  / |  `|| ',
            \ ' ||    ``         || ||         ``    || ||    ``         || ||   | \  / |   || ',
            \ ' ||            .===` `===.         .===`.`===.         .===` /==. |  \/  |   || ',
            \ ' ||         .==`   \_|-_ `===. .===`   _|_   `===. .===` _-|/   `==  \/  |   || ',
            \ ' ||      .==`    _-`    `-_  `=`    _-`   `-_    `=`  _-`   `-_  /|  \/  |   || ',
            \ ' ||   .==`    _-`          `-__\._-`         `-_./__-`         `` |. /|  |   || ',
            \ ' ||.==`    _-`                                                     `` |  /==.|| ',
            \ ' ==`    _-`                        N E O V I M                         \/   `== ',
            \ ' \   _-`                                                                `-_   / ',
            \ '  ```                                                                      ```  ',
            \ ]




"UNDOTREE_______________________________________________________________________

let g:undotree_DiffAutoOpen = 1
let g:undotree_WindowLayout = 2
let g:undotree_ShortIndicators = 1
let g:undotree_SplitWidth = 30
let g:undotree_DiffpanelHeight = 10
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_HelpLine = 0




"CLEVER_F_______________________________________________________________________

let g:clever_f_smart_case = 1
let g:clever_f_ignore_case = 1
let g:clever_f_show_prompt = 1




"ALE____________________________________________________________________________

let g:ale_sign_column_always = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_fix_on_save = 1
let g:ale_linters = {
            \ 'vim': ['vint'],
            \ 'c': ['cc'],
            \ 'haskell': ['ghc'],
            \ 'python': ['flake8'],
            \ }
let g:ale_fixers = {
            \ 'vim': ['trim_whitespace'],
            \ 'c': ['astyle'],
            \ 'haskell': ['brittany'],
            \ }
            " \ 'python': ['yapf'],




"VIMWIKI________________________________________________________________________

let g:vimwiki_global_ext = 0
let g:vimwiki_table_mappings = 0
let g:vimwiki_list = [{
            \ 'path': '~/.vimwiki/',
            \ 'path_html': '~/.vimwiki/html',
            \ 'template_path': '~/.vimwiki/html/templates',
            \ 'template_default': 'default',
            \ 'template_ext': '.tpl',
            \ 'syntax': 'default', 'ext': '.wiki'
            \ },
            \ {
            \ 'path': '~/.config/nvim/.helpwiki',
            \ 'path_html': '~/.config/nvim/.helpwiki/html',
            \ 'syntax': 'default', 'ext': '.wiki'
            \ }]




"WHICHKEY_______________________________________________________________________

let g:which_key_sep = '·'
let g:which_key_max_size = 0
let g:which_key_vertical = 0
let g:which_key_hspace = 5
let g:which_key_disable_default_offset = 1
let g:which_key_centered = 1
let g:which_key_use_floating_win = 1
let g:which_key_floating_opts = {
            \ 'row': '+0',
            \ 'col': '+0',
            \ 'width': '+0',
            \ 'height': '+0'
            \ }
let g:which_key_default_group_name = 'abulafia'
let g:which_key_timeout = 100
let g:which_key_exit = [
            \ "\<C-[>",
            \ "\<Esc>",
            \ ]
let g:which_key_display_names = {
            \ ' '    : '_',
            \ '<C-H>': '░',
            \ '<C-I>': '⇆'  ,
            \ '<TAB>': '⇆'  ,
            \ '<CR>' : '↵'  ,
            \ }




"WHICHKEY-MAPS__________________________________________________________________

let g:which_key_map = {
            \ '<Tab>' : 'open-explore',
            \ 'o'     : 'open-last',
            \ 'e'     : 'new-buffer',
            \ 'v'     : 'select-all',
            \ 't'     : 'new-terminal',
            \ 'p'     : 'open-page',
            \ '-'     : 'toggle-accent',
            \ 'r'     : 'replace-search',
            \ 'u'     : 'toggle-undo',
            \ 'j'     : 'jump-dir',
            \ }
let g:which_key_map['q'] = { 'name' : '+Quit',
            \ 'q' : 'window',
            \ 'a' : 'all-windows',
            \ }
let g:which_key_map['z'] = { 'name' : '+Save',
            \ 'z' : 'buffer',
            \ 'a' : 'all-buffers',
            \ }
let g:which_key_map['d'] = { 'name' : '+Delete',
            \ 'd' : 'buffer',
            \ 'a' : 'all-buffers',
            \ }
let g:which_key_map['s'] = { 'name' : '+Surround',
            \ 'w' : 'full-word',
            \ 'i' : 'inner-word',
            \ 'l' : 'line',
            \ 'r' : 'replace',
            \ 'd' : 'delete',
            \ }
let g:which_key_map['g'] = { 'name' : '+Git',
            \ 'b' : 'buffer-commits',
            \ 'r' : 'repo-commits',
            \ }
let g:which_key_map[' '] = { 'name' : '+Clap',
            \ ' ' : 'clap-cmd',
            \ 'f' : 'files',
            \ 'g' : 'git-files',
            \ 'r' : 'grep-maple',
            \ 'h' : 'history',
            \ 'c' : 'command',
            \ 'l' : 'line-buffer',
            \ 'a' : 'line-all',
            \ 'm' : 'marks',
            \ }
let g:which_key_map['a'] = { 'name' : '+Ale',
            \ 'n' : 'next-wrap',
            \ 'p' : 'prev-wrap',
            \ }
let g:which_key_map['c'] = { 'name' : '+Ale',
            \ 'n' : 'next-wrap',
            \ 'p' : 'prev-wrap',
            \ }
let g:which_key_map.1 = 'which_key_ignore'
let g:which_key_map.2 = 'which_key_ignore'
let g:which_key_map.3 = 'which_key_ignore'
let g:which_key_map.4 = 'which_key_ignore'
let g:which_key_map.5 = 'which_key_ignore'
let g:which_key_map.6 = 'which_key_ignore'
let g:which_key_map.7 = 'which_key_ignore'
let g:which_key_map.8 = 'which_key_ignore'
let g:which_key_map.9 = 'which_key_ignore'
let g:which_key_map.0 = 'which_key_ignore'
call which_key#register('<Space>', 'g:which_key_map')




"KEYMAPPINGS____________________________________________________________________

" remember to check ad set the default web-browser with:
" xdg-settings get default-web-browser
" xdg-settings set default-web-browser brave-browser.desktop

" add support to a plugin for vim-repeat whit the following command:
" silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)


" Generics
xnoremap K :move '<-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nmap <C-p> :-r!xclip -o -sel clip<CR>
vmap <C-y> :!xclip -f -sel clip<CR>


" Jumps
nnoremap <silent><M-d> }}{ zz
nnoremap <silent><M-u> {{ zz


" Window creation & moving
nnoremap <silent><M-h> :call utility#WinMove('h')<CR>
nnoremap <silent><M-j> :call utility#WinMove('j')<CR>
nnoremap <silent><M-k> :call utility#WinMove('k')<CR>
nnoremap <silent><M-l> :call utility#WinMove('l')<CR>


" Window resizing
nnoremap <silent><C-h> :vertical resize -5<CR>
nnoremap <silent><C-l> :vertical resize +5<CR>
nnoremap <silent><C-j> :resize -5<CR>
nnoremap <silent><C-k> :resize +5<CR>


" Window rotation & reordering
nnoremap <silent><M-H> :wincmd<Space>H<CR>
nnoremap <silent><M-L> :wincmd<Space>L<CR>
nnoremap <silent><M-J> :wincmd<Space>J<CR>
nnoremap <silent><M-K> :wincmd<Space>K<CR>


" Buffer movements
nnoremap <silent><M-Tab> :bnext<CR><C-g>
nnoremap <silent><M-Backspace> :buffer#<CR>


" Vimcompletesme
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Commentary
nmap <silent><M-Space> gcc<CR>
vmap <silent><M-Space> gc<CR>




"WHICHKEY-MAPPINGS____________________________________________________________________

" Generics
nnoremap <leader>qq :quit<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>zz :write<CR>
nnoremap <leader>za :wa<CR>
nnoremap <leader>dd :Bclose<CR>
nnoremap <leader>da :bufdo<space>bd<bar>Dashboard<CR>
nmap     <leader>p  <esc>gx
nnoremap <leader>o  :OpenLast<CR>
nnoremap <leader>e  :DashboardNewFile<CR>
nnoremap <leader>v  :SelectAll<CR>
nnoremap <leader>t  :terminal<CR>


" Accent, selection
nnoremap <leader>- :ToggleAccent<space><CR>
nnoremap <leader>r :%s///gc<Left><Left><Left>
xnoremap <leader>r :s///gc<Left><Left><Left>


" Surround
vmap <leader>s  S
nmap <leader>sw ysw
nmap <leader>si ysiw
nmap <leader>sl yss
nmap <leader>sr cs
nmap <leader>sd ds


" UndotreeToggle & Netrw
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader><Tab> :Explore<CR>


" Gv
nnoremap <leader>gb :GV!<CR>
vnoremap <leader>gb :GV!<CR>
nnoremap <leader>gr :GV<CR>


" Clap
nnoremap <leader><Space><Space> :Clap<CR>
nnoremap <leader><Space>f :Clap files<CR>
nnoremap <leader><Space>g :Clap git_files<CR>
nnoremap <leader><Space>r :Clap grep2<CR>
nnoremap <leader><Space>h :Clap history<CR>
nnoremap <leader><Space>c :Clap command<CR>
nnoremap <leader><Space>l :Clap blines<CR>
nnoremap <leader><Space>a :Clap lines<CR>
nnoremap <leader><Space>m :Clap marks<CR>


" Ale jumps
nmap <leader>an <Plug>(ale_next_wrap)
nmap <leader>ap <Plug>(ale_previous_wrap)


" Switch & Colors
nnoremap <leader>j :JumpDir<CR>
nnoremap <leader>cn :ColorNext<CR>
nnoremap <leader>cp :ColorPrev<CR>


" Buftabline
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)


" WhichKey
nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent><leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent><localleader> :<c-u>WhichKey ','<CR>
vnoremap <silent><localleader> :<c-u>WhichKeyVisual '<Space>'<CR>




"USEFUL_COMMANDS________________________________________________________________

command! SelectAll execute "normal \ggVG"
command! RemoveSpaces :%s/\s\+$//e
command! Squish execute "normal \ggVGgq"
command! ClearLastSearch :let @/=""

command! LongLine call utility#LongLine()
command! ToggleAccent call utility#ToggleAccent()
command! ColorNext call colors#StepColorNext()
command! ColorPrev call colors#StepColorPrev()

command! FindRoot call root#FindRoot()
command! JumpDir call switch#JumpDir()
command! -nargs=1 -complete=dir RootDir call switch#RootDir(<f-args>)
command! CurrentRootDir call switch#CurrentRootDir()

command! SaveLast call session#SaveLast()
command! OpenLast call session#OpenLast()
command! DeleteLast call session#DeleteLast()

command! -bang -complete=buffer -nargs=? Bclose call close#Bclose(<q-bang>, <q-args>)
command! -nargs=* -complete=help Help call utility#Help(<f-args>)
command! WhichKeyRegister call which_key#register('<Space>', "g:which_key_map")

" Mapped ones:
"     SelectAll,
"     ToggleAccent,
"     ColorNext,
"     ColorPrev,
"     JumpDir,
"     SaveLast,
"     Bclose
