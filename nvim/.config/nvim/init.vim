
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
"    undotree                  https://github.com/mbbill/undotree
"    vim-buftabline            https://github.com/ap/vim-buftabline
"    vim-startify              https://github.com/mhinz/vim-startify
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
    Plug 'mbbill/undotree'
    Plug 'ap/vim-buftabline'
    Plug 'mhinz/vim-startify'
    Plug 'vimwiki/vimwiki'
call plug#end()




"SETTINGS_______________________________________________________________________

syntax on
color monokai16
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
set omnifunc=ale#completion#OmniFunc  "syntaxcomplete#Complete
set complete+=k/usr/share/dict/british-english
set complete+=k/usr/share/dict/italian
set completeopt=menuone,longest
set shortmess+=c
set autochdir
set hidden
set guifont=mononoki\ Nerd\ Font\ 9
set updatetime=100  "default is 4000ms
set guioptions-=e
set showtabline=2
set laststatus=2
set statusline=
set statusline+=%{utility#StatuslineGit()}
set statusline+=%f
set statusline+=%{utility#BufferStatus()}
set statusline+=%=
set statusline+=%{utility#LineInfo()}


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


highlight! link netrwMarkFile Search

highlight LineNr                    guibg=#282936 guifg=#626483
highlight SignColumn                guibg=#282936 guifg=#626483
highlight ColorColumn               guibg=#2A2C38 guifg=none

highlight CursorLine                guibg=#2A2C38 guifg=none
highlight CursorLineNr              guibg=none    guifg=#F1FA8C

highlight Normal                    guibg=#282936 guifg=none
highlight EndOfBuffer               guibg=#2A2C38 guifg=#626483

highlight StatusLine                guibg=#3A3C4E guifg=#6699FF gui=none
highlight StatusLineNC              guibg=#3A3C4E guifg=#BFBFBF gui=none
highlight VertSplit                 guibg=#3A3C4E guifg=#3A3C4E

highlight TabLineSel                guibg=#3A3C4E guifg=#6699FF gui=none
highlight TabLine                   guibg=#3A3C4E guifg=#BFBFBF gui=none
highlight TabLineFill               guibg=#3A3C4E guifg=none    gui=none

highlight BufTabLineCurrent         guibg=#3A3C4E guifg=#6699FF gui=none
highlight BufTabLineActive          guibg=#3A3C4E guifg=#BFBFBF gui=none
highlight BufTabLineHidden          guibg=#3A3C4E guifg=#626483 gui=none
highlight BufTabLineFill            guibg=#3A3C4E guifg=none    gui=none
highlight BufTabLineModifiedCurrent guibg=#3A3C4E guifg=#6699FF gui=none
highlight BufTabLineModifiedActive  guibg=#3A3C4E guifg=#BFBFBF gui=none
highlight BufTabLineModifiedHidden  guibg=#3A3C4E guifg=#626483 gui=none

highlight ALEErrorSign              guibg=#282936 guifg=#FF79C6 gui=none
highlight ALEWarningSign            guibg=#282936 guifg=#BD93F9 gui=none




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


" Netrw mappings
augroup netrw
    autocmd!
    autocmd Filetype netrw call utility#NetrwMapping()
augroup END


" Terminal windows settings
augroup termwin
    autocmd!
    autocmd TermOpen,BufWinEnter,WinEnter term://*h startinsert
    autocmd TermOpen,TermEnter term://*h call utility#TermMapping()
augroup END




"MY_VARIABLES___________________________________________________________________

let g:mapleader = "\<space>"
let g:maplocalleader = ','
let g:longline = 'none'




"NETRW__________________________________________________________________________


let g:netrw_banner = 0
let g:netrw_keepdir = 0
let g:netrw_liststyle = 4
let g:netrw_sort_options = 'i'
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_browsex_viewer = 'xdg-open'
let ghregex = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide = ghregex
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




"BUFTABLINE_____________________________________________________________________

let g:buftabline_show = 1
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1




"STARTIFY_______________________________________________________________________

let g:startify_files_number = 5
let g:startify_list_order = [
            \ [' Recent Files:'], 'files',
            \ [' Dir recent files:'], 'dir',
            \ [' Saved sessions:'], 'sessions',
            \ [' Bookmarks:'], 'bookmarks',
            \ [' Commands:'], 'commands',
            \ ]
let g:startify_bookmarks = [
            \ '$HOME/.dotfiles',
            \ '$HOME/.vimwiki/index.wiki',
            \ ]
let g:startify_commands = [
            \ {'d': ['bdelete', 'bdelete']},
            \ {'t': ['terminal', 'terminal']},
            \ {'w': ['netrw', 'Explore']},
            \ ]
let g:startify_custom_indices = [
            \ 'a', 'b', 'c', 'f', 'g', 'h', 'i', 'l', 'm', 'n',
            \ 'o', 'p', 'r', 's', 'u', 'v', 'x', 'y', 'z'
            \ ]
let g:startify_session_dir = '~/.config/nvim/sessions'
let g:startify_custom_header = [
            \' ┌──────────────────────────────────────────┐',
            \' │  I chose not to choose life.             │',
            \' │  I chose somethin’ else.                 │',
            \' │  And the reasons? There are no reasons.  │',
            \' │  Who needs reasons when you’ve got Vim?  │',
            \' └───┬──────────────────────────────────────┘',
            \'     │      (\_/)',
            \'     └───── (O.o)',
            \'            (> <)',
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
            \ 'syntax': 'default', 'ext': '.wiki'
            \ }]




"KEYMAPPINGS____________________________________________________________________


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
nnoremap <silent><M-Backspace> :buffer#<CR>

nnoremap <silent><M-d> }}{ zz
nnoremap <silent><M-u> {{ zz

xnoremap K :move '<-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv

nnoremap <leader>w <C-W>
nnoremap <leader>q :quit<CR>
nnoremap <leader>z :write<CR>
nnoremap <leader>Z :bufdo write<CR>  "needs hidden
nnoremap <leader>e :Startify<CR>
nnoremap <leader>d :Startify<bar>bdelete#<CR>
nnoremap <leader>v :SelectAll<CR>
nnoremap <leader>i :SClose<CR>
nnoremap <leader>t :terminal<CR>

nmap <C-p> :-r!xclip -o -sel clip<CR>
vmap <C-y> :!xclip -f -sel clip<CR>
map  <leader>u <esc>gx
vmap <Tab> >gv
vmap <S-Tab> <gv


" Toggle accent
nnoremap <silent><Backspace> :ToggleAccent<space><CR>


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


" UndotreeToggle & Netrw
nnoremap <leader><Esc> :UndotreeToggle<CR>
nnoremap <leader><Tab> :Explore<CR>


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
command! Root call root#FindRoot()
command! -nargs=1 ChangeRoot call switch#change_root(<f-args>)
command! ChangeRootCurrent call switch#change_root_current()
command! SwitchDir call switch#switch_dir()
command! ToggleAccent call utility#ToggleAccent()


" without remap
command! Longline call utility#LongLine()
command! RemoveSpaces :%s/\s\+$//e
command! Squish execute "normal \ggVGgq"
