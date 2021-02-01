
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
"    vim-surround              https://github.com/tpope/vim-surround
"    vim-repeat                https://github.com/tpope/vim-repeat
"    vim-commentary            https://github.com/tpope/vim-commentary
"    vim-fugitive              https://github.com/tpope/vim-fugitive
"    gv                        https://github.com/junegunn/gv.vim
"    fzf                       https://github.com/junegunn/fzf.vim
"    vim-floaterm              https://github.com/voldikss/vim-floaterm
"    undotree                  https://github.com/mbbill/undotree
"    lightline                 https://github.com/itchyny/lightline.vim
"    lightline-bufferline      https://github.com/mengelbrecht/lightline-bufferline
"    vim-startify              https://github.com/mhinz/vim-startify
"    vim-signify               https://github.com/mhinz/vim-signify
"    vimwiki                   https://github.com/vimwiki/vimwiki
"    vim-devicons              https://github.com/ryanoasis/vim-devicons




"VIM_PLUG_______________________________________________________________________

augroup vimenter
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
augroup END

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
    Plug 'dense-analysis/ale'
    Plug 'sheerun/vim-polyglot'
    Plug 'ajh17/VimCompletesMe'
    Plug 'rhysd/clever-f.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'junegunn/fzf', {'do': { -> fzf#install() }} | Plug 'junegunn/fzf.vim'
    Plug 'voldikss/vim-floaterm'
    Plug 'mbbill/undotree'
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'
    Plug 'mhinz/vim-startify'
    Plug 'mhinz/vim-signify'
    Plug 'vimwiki/vimwiki'
    Plug 'ryanoasis/vim-devicons'
call plug#end()




"SETTINGS_______________________________________________________________________

syntax on
color dracula16
filetype plugin indent on

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
set noshowmode
set showcmd
set nocursorline
set noerrorbells
set nofoldenable
set foldmethod=manual
set nospell
set omnifunc=ale#completion#OmniFunc  "syntaxcomplete#Complete
set complete+=k/usr/share/dict/british-english
set complete+=k/usr/share/dict/italian
set completeopt=menuone,longest
set shortmess+=c
set autochdir
set laststatus=2
set showtabline=2
set guioptions-=e
set guifont=mononoki\ Nerd\ Font\ 9
set updatetime=100  "default is 4000ms


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


highlight LineNr       guibg=NONE
highlight SignColumn   guibg=NONE
highlight CursorLineNr guibg=NONE guifg=#F1FA8C

highlight CursorLine  guibg=#2A2C38
highlight ColorColumn guibg=#2A2C38
highlight VertSplit   guibg=#2C323D guifg=#2C323D
highlight Normal      guibg=#282936

highlight StatusLine   guibg=#2C323D gui=NONE
highlight StatusLineNC guibg=#2C323D gui=NONE

highlight Floaterm       guibg=NONE
highlight FloatermBorder guibg=NONE guifg=#3A3C4E




"AUTOGROUPS_____________________________________________________________________

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




"MY_VARIABLES___________________________________________________________________

let g:mapleader = "\<space>"
let g:maplocalleader = ','
let g:netrw_browsex_viewer = 'xdg-open'
let g:longline = 'none'




"NETRW__________________________________________________________________________

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_sort_sequence = '[\/]$,*'
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




"FZF____________________________________________________________________________

let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = {'window': {'width': 1.00, 'height': 1.00}} "{'down': '50%'}
let g:fzf_colors = {
            \ 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment']
            \ }




"LIGHTLINE_&_BUFFERLINE_________________________________________________________

let g:lightline = {
            \ 'colorscheme': 'one',
            \ 'active': {
            \     'left':[ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'tabline': {
            \     'left': [ ['buffers'] ],
            \     'right': [ ['close'] ]
            \ },
            \ 'component': { 'lineinfo': ' %3l:%-2v', },
            \ 'component_function': { 'gitbranch': 'fugitive#head', },
            \ 'component_expand': { 'buffers': 'lightline#bufferline#buffers' },
            \ 'component_type': { 'buffers': 'tabsel' }
            \ }
let g:lightline.separator = {
            \ 'left': '',
            \ 'right': ''
            \ }
let g:lightline.subseparator = {
            \ 'left': '',
            \ 'right': ''
            \ }
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#enable_devicons = 0
let g:lightline#bufferline#enable_nerdfont= 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#min_buffer_count = 2
let g:lightline#bufferline#modified = ' +'
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#smart_path = 1




"STARTIFY_______________________________________________________________________

let g:startify_files_number = 5
let g:startify_list_order = [
            \ ['   Recently used files:'], 'files',
            \ ['   Current directory files:'], 'dir',
            \ ['   Saved sessions:'], 'sessions',
            \ ]
let g:startify_custom_indices = [
            \ 'a', 'b', 'c', 'd', 'f', 'g', 'h', 'i', 'l', 'm', 'n',
            \ 'o', 'p', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'x'
            \ ]
let g:startify_session_dir = '~/.config/nvim/sessions'
let g:startify_custom_header = [
            \'',
            \'    ┌──────────────────────────────────────────┐',
            \'    │  I chose not to choose life.             │',
            \'    │  I chose somethin’ else.                 │',
            \'    │  And the reasons? There are no reasons.  │',
            \'    │  Who needs reasons when you’ve got Vim?  │',
            \'    └───┬──────────────────────────────────────┘',
            \'        │',
            \'        │      (\_/)',
            \'        └───── (O.o)',
            \'               (> <)',
            \'',
            \ ]




"FLOATERM_______________________________________________________________________

let g:floaterm_autoinsert=1
let g:floaterm_width=1.00
let g:floaterm_height=1.00
let g:floaterm_position='bottomleft'
let g:floaterm_autoclose=2
let g:floaterm_title='($1|$2)'




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
            \ 'python': ['yapf'],
            \ }




"VIMWIKI________________________________________________________________________

let g:vimwiki_global_ext = 0
let g:vimwiki_table_mappings = 0
let g:vimwiki_list = [{
            \ 'path': '~/vimwiki/',
            \ 'syntax': 'default', 'ext': '.wiki'
            \ }]




"KEYMAPPINGS____________________________________________________________________


nnoremap <silent><M-Backspace> :!vimpager $HOME/.config/nvim/startscreen<CR>g


" Generics
nnoremap <silent><C-h> :vertical resize -5<CR>
nnoremap <silent><C-l> :vertical resize +5<CR>
nnoremap <silent><C-j> :resize -5<CR>
nnoremap <silent><C-k> :resize +5<CR>

nnoremap <leader><M-h> :wincmd<Space><S-h><CR>
nnoremap <leader><M-l> :wincmd<Space><S-l><CR>
nnoremap <leader><M-j> :wincmd<Space><S-j><CR>
nnoremap <leader><M-k> :wincmd<Space><S-k><CR>

nnoremap <silent><M-k> :new<bar>Startify<CR>
nnoremap <silent><M-j> :belowright new<bar>Startify<CR>
nnoremap <silent><M-h> :vnew<bar>Startify<CR>
nnoremap <silent><M-l> :belowright vnew<bar>Startify<CR>
nnoremap <silent><M-Space> :wincmd<Space>w<CR>

nnoremap <silent><M-d> }}{ zz
nnoremap <silent><M-u> {{ zz

xnoremap K :move '<-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv

nnoremap <leader>w <C-W>
nnoremap <leader>q :quit<CR>
nnoremap <leader>z :write<CR>
nnoremap <leader>e :enew<bar>Startify<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>v :SelectAll<CR>
nnoremap <leader>i :SClose<CR>

nmap <C-p> :-r!xclip -o -sel clip<CR>
vmap <C-y> :!xclip -f -sel clip<CR>
map  <leader>u <esc>gx
vmap <Tab> >gv
vmap <S-Tab> <gv


" Toggle accent
nnoremap <silent>- :ToggleAccent<space><CR>


" Replace selection
nnoremap <leader>r :%s///gc<Left><Left><Left>
xnoremap <leader>r :s///gc<Left><Left><Left>


" Switch & Root
nnoremap <leader>C :ChangeRoot<space>
nnoremap <leader>c :ChangeRootCurrent<CR>
nnoremap <leader>X :Root<CR>
nnoremap <leader>x :SwitchDir<CR>


" Commentary
nmap <leader><Space> gcc<CR>
vmap <leader><Space> gc<CR>


" Vimcompletesme
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Surround
map  <leader>s <esc>ysiw
vmap <leader>s <S-s>
map  <leader>a <esc>cs
map  <leader>A <esc>ds


" Floaterm
nnoremap <silent><M-Return> :FloatermToggle<CR>
tnoremap <silent><M-Return> <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent><M-Backspace> <C-\><C-n>:FloatermKill<CR>
tnoremap <silent><M-Tab> <C-\><C-n>:FloatermNext<CR>
tnoremap <silent><M-Space> <C-\><C-n>:FloatermNew<CR>


" Floaterm programs
nnoremap <leader><Tab> :FloatermNew vifm<CR>
nnoremap <leader><Esc> :FloatermNew ranger<CR>
nnoremap <leader><Return> :FloatermNew tig<CR>
nnoremap <leader>t :FloatermNew htop<CR>


" UndotreeToggle
nnoremap <leader><Backspace> :UndotreeToggle<CR>


" Gv
nnoremap <leader>j :GV!<CR>
vnoremap <leader>j :GV!<CR>
nnoremap <leader>J :GV<CR>


" Fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>k :Commands<CR>
nnoremap <leader>K :History:<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>L :Lines<CR>


" Buffer movements - Buftabline
nmap <silent><M-Tab> :bnext<CR><C-g>
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
nmap <Leader><M-1> <Plug>lightline#bufferline#delete(1)
nmap <Leader><M-2> <Plug>lightline#bufferline#delete(2)
nmap <Leader><M-3> <Plug>lightline#bufferline#delete(3)
nmap <Leader><M-4> <Plug>lightline#bufferline#delete(4)
nmap <Leader><M-5> <Plug>lightline#bufferline#delete(5)
nmap <Leader><M-6> <Plug>lightline#bufferline#delete(6)
nmap <Leader><M-7> <Plug>lightline#bufferline#delete(7)
nmap <Leader><M-8> <Plug>lightline#bufferline#delete(8)
nmap <Leader><M-9> <Plug>lightline#bufferline#delete(9)
nmap <Leader><M-0> <Plug>lightline#bufferline#delete(10)




"USEFUL_COMMANDS________________________________________________________________

command! SelectAll execute "normal \ggVG"
command! Root call root#FindRoot()
command! -nargs=1 ChangeRoot call switch#change_root(<f-args>)
command! ChangeRootCurrent call switch#change_root_current()
command! SwitchDir call switch#switch_dir()
command! ToggleAccent call utility#ToggleAccent()
command! Shortcuts :!vimpager $HOME/.config/nvim/startscreen
command! -nargs=* EasyTerm call utility#EasyTerm(<q-args>)


" Without remap
command! Longline call utility#LongLine()
command! RemoveSpaces :%s/\s\+$//e
command! Squish execute "normal \ggVGgq"
