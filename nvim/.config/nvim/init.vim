
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


"                           VIM EXTENSIONS
"                   [ Plug 'repo-name/plugin-name' ]
"
"    vim-plug                  https://github.com/junegunn/vim-plug
"    ale                       https://github.com/dense-analysis/ale
"    auto-pairs                https://github.com/jiangmiao/auto-pairs
"    vim-surround              https://github.com/tpope/vim-surround
"    vim-commentary            https://github.com/tpope/vim-commentary
"    vim-fugitive              https://github.com/tpope/vim-fugitive
"    vim-signify               https://github.com/mhinz/vim-signify
"    vim-startify              https://github.com/mhinz/vim-startify
"    clever-f                  https://github.com/rhysd/clever-f.vim
"    vim-polyglot              https://github.com/sheerun/vim-polyglot
"    vimcompletesme            https://github.com/ajh17/VimCompletesMe
"    fzf.vim                   https://github.com/junegunn/fzf.vim
"    undotree                  https://github.com/mbbill/undotree
"    floaterm                  https://github.com/voldikss/vim-floaterm
"    vim-airline               https://github.com/vim-airline/vim-airline
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
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
    Plug 'mhinz/vim-startify'
    Plug 'rhysd/clever-f.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'ajh17/VimCompletesMe'
    Plug 'junegunn/fzf', {'do': { -> fzf#install() }} | Plug 'junegunn/fzf.vim'
    Plug 'mbbill/undotree'
    Plug 'voldikss/vim-floaterm'
    Plug 'vim-airline/vim-airline'
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
set omnifunc=ale#completion#OmniFunc "syntaxcomplete#Complete
set complete+=k/usr/share/dict/british-english
set complete+=k/usr/share/dict/italian
set laststatus=2
set updatetime=100

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
highlight CursorLineNr guibg=NONE guifg='#F1FA8C'
highlight CursorLine   guibg='#2A2C38'
highlight ColorColumn  guibg='#2A2C38'
highlight VertSplit    guibg='#343746' guifg='#343746'

highlight FloatermBorder guibg=NONE guifg=#44475A

highlight SignifySignAdd    guibg=NONE guifg=#00FF00
highlight SignifySignDelete guibg=NONE guifg=#FF0000
highlight SignifySignChange guibg=NONE guifg=#FFFF00




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
    autocmd InsertEnter * set cul
    autocmd InsertLeave * set nocul
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

let b:vcm_tab_complete = "omni"




"FZF____________________________________________________________________________

let g:fzf_preview_window = 'right:60%'
let g:fzf_layout = { 'down': '60%' } "{ 'window': { 'width': 0.8, 'height': 0.8 } }




"FLOATERM_______________________________________________________________________

let g:floaterm_keymap_toggle = '<M-1>'
let g:floaterm_keymap_next = '<M-2>'
let g:floaterm_keymap_new  = '<M-3>'
let g:floaterm_width = 0.7
let g:floaterm_height = 0.7




"UNDOTREE_______________________________________________________________________

let g:undotree_DiffAutoOpen = 1
let g:undotree_WindowLayout = 3
let g:undotree_ShortIndicators = 1
let g:undotree_SplitWidth = 30
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_HelpLine = 0




"CLEVER_F_______________________________________________________________________

let g:clever_f_smart_case = 0
let g:clever_f_ignore_case = 0
let g:clever_f_show_prompt = 1




"ALE____________________________________________________________________________

let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
            \ 'vim': ['vint'],
            \ 'c': ['gcc', 'clang'],
            \ 'cpp': ['gcc', 'clang'],
            \ 'java': ['java'],
            \ 'python': ['flake8', 'pylint'],
            \ 'javascript': ['eslint'],
            \}
let g:ale_fixers = {
            \ 'python': ['yapf'],
            \}




"AIRLINE________________________________________________________________________

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'dracula'




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
            \'                                                             ',
            \'    /##    /#                      /##    /##/##             ',
            \'   | ###  | ##                    | ##   | #|__/             ',
            \'   | #### | ##  /######   /###### | ##   | ##/##/######/#### ',
            \'   | ## ##| ## /##__  ## /##__  ##|  ## / ##| #| ##_  ##_  ##',
            \'   | ##  ## ##| ########| ##  | ## \  ## ##/| #| ## \ ## \ ##',
            \'   | ##\  ####| ##_____/| ##  | ##  \  ###/ | #| ## | ## | ##',
            \'   |  # \  ## |  #######|  ######    \  #/  | #| ## | ## | ##',
            \'    \__  \__/  \_______/ \______/     \_/   |__|__/ |__/ |__/',
            \'                                                             ',
            \'                                                             ',
            \ ]




"KEYMAPPINGS____________________________________________________________________

nnoremap <silent><M-Return> :!cat ~/.config/nvim/keymappings<CR>


" Generics
nnoremap <silent><C-h> <C-W><C-<>
nnoremap <silent><C-l> <C-W><C->>
nnoremap <silent><C-j> <C-W><C-->
nnoremap <silent><C-k> <C-W><C-+>

nnoremap <silent><M-k> :new<CR>
nnoremap <silent><M-j> :belowright new<CR>
nnoremap <silent><M-h> :vnew<CR>
nnoremap <silent><M-l> :belowright vnew<CR>
nnoremap <silent><M-Space> <C-W>w

nnoremap <silent><Tab> }}{ zz
nnoremap <silent><Backspace> {{ zz

xnoremap K :move '<-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv

nnoremap <leader>w <C-W>
nnoremap <leader>q :quit<CR>
nnoremap <leader>z :write<CR>
nnoremap <leader>e :enew<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>i :SClose<CR>

map <leader>u <esc>gx
nmap <silent><M-Tab> :bnext<CR><C-g>
nmap <silent><M-Backspace> :bprev<CR><C-g>
nmap <C-p> :-r!xclip -o -sel clip<CR>
vmap <C-y> :!xclip -f -sel clip<CR>
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


" Netrw - UndotreeToggle
nnoremap <leader><Tab> :Explore<CR>
nnoremap <leader><Backspace> :UndotreeToggle<CR>


" I love my terminal file managers!
nnoremap <leader>1 :FloatermNew vifm<CR>
nnoremap <leader>2 :FloatermNew ranger<CR>
nnoremap <leader>3 :FloatermNew fff<CR>
nnoremap <leader>4 :FloatermNew nnn<CR>


" Fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>j :Ag<CR>
nnoremap <leader>k :Commands<CR>
nnoremap <leader>K :History:<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>L :Lines<CR>




"USEFUL_COMMANDS________________________________________________________________

command! Squish execute "normal \ggVGgq"
command! Root call root#FindRoot()
command! -nargs=1 ChangeRoot call switch#change_root(<f-args>)
command! ChangeRootCurrent call switch#change_root_current()
command! SwitchDir call switch#switch_dir()
command! Longline call utility#LongLine()
command! ToggleAccent call utility#ToggleAccent()
