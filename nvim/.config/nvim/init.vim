
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
"    vim-unimpaired            https://github.com/tpope/vim-unimpaired
"    vim-repeat                https://github.com/tpope/vim-repeat
"    vim-commentary            https://github.com/tpope/vim-commentary
"    vim-fugitive              https://github.com/tpope/vim-fugitive
"    gv                        https://github.com/junegunn/gv.vim
"    fzf                       https://github.com/junegunn/fzf.vim
"    vifm                      https://github.com/vifm/vifm.vim
"    vim-ctrlspace             https://github.com/vim-ctrlspace/vim-ctrlspace
"    undotree                  https://github.com/mbbill/undotree
"    vim-buftabline            https://github.com/ap/vim-buftabline
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
        silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" >
                    \ ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
        autocmd VimEnter * PlugInstall
    endif
    call utility#Start() "intro
augroup END

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
    Plug 'dense-analysis/ale'
    Plug 'sheerun/vim-polyglot'
    Plug 'ajh17/VimCompletesMe'
    Plug 'rhysd/clever-f.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'junegunn/fzf', {'do': { -> fzf#install() }} | Plug 'junegunn/fzf.vim'
    Plug 'vifm/vifm.vim'
    Plug 'vim-ctrlspace/vim-ctrlspace'
    Plug 'mbbill/undotree'
    Plug 'ap/vim-buftabline'
    Plug 'vimwiki/vimwiki'
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
set showmode
set showcmd
set nocursorline
set noerrorbells
set nofoldenable
set foldmethod=manual
set nospell
set omnifunc=ale#completion#OmniFunc "syntaxcomplete#Complete
set complete+=k/usr/share/dict/british-english
set complete+=k/usr/share/dict/italian
set completeopt=menuone,longest
set shortmess+=c
set autochdir
set laststatus=2


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
highlight CursorLineNr guibg=NONE    guifg=#F1FA8C
highlight StatusLine   guibg=#3A3C4E guifg=#BFBFBF

highlight CursorLine  guibg=#2A2C38
highlight ColorColumn guibg=#2A2C38
highlight VertSplit   guibg=#3A3C4E guifg=#3A3C4E

highlight BufTabLineCurrent guibg=#3A3C4E guifg=#BFBFBF gui=BOLD
highlight BufTabLineActive  guibg=#3A3C4E guifg=#BFBFBF gui=BOLD
highlight BufTabLineHidden  guibg=#3A3C4E guifg=#626483 gui=BOLD
highlight BufTabLineFill    guibg=#3A3C4E




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


" Change multiple statusbar in vimenter
augroup statuslineautocmds
    autocmd!
    autocmd VimEnter              * call superbar#UpdateInactiveWindows()
    autocmd WinEnter,BufWinEnter  * call superbar#StatusLine("active")
    autocmd WinLeave              * call superbar#StatusLine("inactive")
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




"VIFM___________________________________________________________________________

let g:vifm = '~/bin/vifmrun'
let g:vifm_replace_netrw = 1
let g:vifm_replace_netrw_cmd = 1




"UNDOTREE_______________________________________________________________________

let g:undotree_DiffAutoOpen = 1
let g:undotree_WindowLayout = 2
let g:undotree_ShortIndicators = 1
let g:undotree_SplitWidth = 30
let g:undotree_DiffpanelHeight = 10
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_HelpLine = 0




"BUFTABLINE_____________________________________________________________________

let g:buftabline_show = 1
let g:buftabline_numbers = 2




"CLEVER_F_______________________________________________________________________

let g:clever_f_smart_case = 1
let g:clever_f_ignore_case = 1
let g:clever_f_show_prompt = 1




"ALE____________________________________________________________________________

let g:ale_fix_on_save = 1
let g:ale_linters = {
            \ 'c': ['cc'],
            \ 'cpp': ['cc'],
            \ 'java': ['javac'],
            \ 'python': ['flake8'],
            \ 'vim': ['vint'],
            \ }
let g:ale_fixers = {
            \ 'c': ['astyle'],
            \ 'cpp': ['astyle'],
            \ 'java': ['google_java_format'],
            \ 'python': ['yapf'],
            \ 'vim': ['trim_whitespace'],
            \ }




"VIMWIKI________________________________________________________________________

let g:vimwiki_global_ext = 0
let g:vimwiki_table_mappings = 0
let g:vimwiki_list = [{
            \ 'path': '~/vimwiki/',
            \ 'syntax': 'default', 'ext': '.wiki'
            \ }]




"KEYMAPPINGS____________________________________________________________________

nnoremap <silent><M-Return> :!cat ~/.config/nvim/startscreen<CR>


" Generics
nnoremap <silent><C-h> :vertical resize -5<CR>
nnoremap <silent><C-l> :vertical resize +5<CR>
nnoremap <silent><C-j> :resize -5<CR>
nnoremap <silent><C-k> :resize +5<CR>

nnoremap <leader><M-h> :wincmd<Space><S-h><CR>
nnoremap <leader><M-l> :wincmd<Space><S-l><CR>
nnoremap <leader><M-j> :wincmd<Space><S-j><CR>
nnoremap <leader><M-k> :wincmd<Space><S-k><CR>

nnoremap <silent><M-k> :new<CR>
nnoremap <silent><M-j> :belowright new<CR>
nnoremap <silent><M-h> :vnew<CR>
nnoremap <silent><M-l> :belowright vnew<CR>
nnoremap <silent><M-Space> :wincmd<Space>w<CR>

nnoremap <silent><M-d> }}{ zz
nnoremap <silent><M-u> {{ zz

xnoremap K :move '<-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv

nnoremap <leader>w <C-W>
nnoremap <leader>q :quit<CR>
nnoremap <leader>z :write<CR>
nnoremap <leader>e :enew<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>i :bufdo bdelete<Bar>call utility#Start()<CR>
nnoremap <leader>v :SelectAll<CR>

nmap <C-p> :-r!xclip -o -sel clip<CR>
vmap <C-y> :!xclip -f -sel clip<CR>
map <leader>u <esc>gx
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


" Vifm - UndotreeToggle
nnoremap <leader><Tab> :EditVifm<CR>
nnoremap <leader><Esc> :UndotreeToggle<CR>


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



"USEFUL_COMMANDS________________________________________________________________

command! SelectAll execute "normal \ggVG"
command! Squish execute "normal \ggVGgq"
command! RemoveSpaces :%s/\s\+$//e
command! Longline call utility#LongLine()
command! Root call root#FindRoot()
command! -nargs=1 ChangeRoot call switch#change_root(<f-args>)
command! ChangeRootCurrent call switch#change_root_current()
command! SwitchDir call switch#switch_dir()
command! ToggleAccent call utility#ToggleAccent()
