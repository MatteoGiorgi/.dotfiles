
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
"    auto-pairs                https://github.com/jiangmiao/auto-pairs
"    vim-surround              https://github.com/tpope/vim-surround
"    vim-commentary            https://github.com/tpope/vim-commentary
"    vimcompletesme            https://github.com/ajh17/VimCompletesMe
"    fzf                       https://github.com/junegunn/fzf
"    fzf.vim                   https://github.com/junegunn/fzf.vim
"    undotree                  https://github.com/mbbill/undotree




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
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'ajh17/VimCompletesMe'
    Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
    Plug 'junegunn/fzf.vim'
    Plug 'mbbill/undotree'
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
set omnifunc=syntaxcomplete#Complete
set complete+=k/usr/share/dict/british-english
set complete+=k/usr/share/dict/italian
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
highlight CursorLineNr guibg=NONE guifg='#F1FA8C'
highlight CursorLine   guibg='#2A2C38'
highlight ColorColumn  guibg='#2A2C38'
highlight VertSplit    guibg='#343746' guifg='#343746'




"AUTOGROUPS_____________________________________________________________________

" Automatically change root directory
if g:root#auto == 1
    augroup root
        autocmd!
        execute 'autocmd BufEnter ' . g:root#autocmd_patterns . ' :Root'
    augroup END
endif


" Change statusbar in fzf windows
augroup fzfstatusline
    autocmd! User FzfStatusLine call FzfStatusline()
augroup END


" Change linenumber behaviour in insert mode
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" Change cursorline and statusbar colors in insert mode
augroup vimrc
    autocmd InsertEnter * set cul
    autocmd InsertEnter * highlight User1 guibg='#6272A4' guifg='#BFBFBF' gui=BOLD
    autocmd InsertEnter * highlight User2 guibg='#343746' guifg='#6272A4' gui=BOLD
    autocmd InsertLeave * set nocul
    autocmd InsertLeave * highlight User1 guibg='#BFBFBF' guifg='#343746' gui=BOLD
    autocmd InsertLeave * highlight User2 guibg='#343746' guifg='#BFBFBF' gui=BOLD
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

let b:vcm_tab_complete = "omni"




"FZF____________________________________________________________________________

let g:fzf_layout = { 'down': '50%' }




"UNDOTREE_______________________________________________________________________

let g:undotree_DiffAutoOpen = 1
let g:undotree_WindowLayout = 3
let g:undotree_ShortIndicators = 1
let g:undotree_SplitWidth = 30
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_HelpLine = 0




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


" Netrw & UndotreeToggle
nnoremap <leader><Tab> :Explore<CR>
nnoremap <leader><Backspace> :UndotreeToggle<CR>


" Fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>j :Buffers<CR>
nnoremap <leader>k :Commands<CR>
nnoremap <leader>K :History:<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>L :Lines<CR>




"FUNCTIONS______________________________________________________________________

function! LongLine()
    if (g:longline ==? 'none')
        let g:longline = 'all'
        setlocal virtualedit=all
    else
        let g:longline = 'none'
        setlocal virtualedit=
    endif
endfunction


function! FzfStatusline()
    setlocal statusline=%3*\ \ \ \ FZF
endfunction


function! ToggleAccent()
    let withAccent   = ["á", "é", "í", "ó", "ú", "Á", "É", "Í", "Ó", "Ú"]
    let withNoAccent = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    let character = matchstr(getline('.'), '\%' . col('.') . 'c.')
    let position = match(withNoAccent, character)
    if position != -1
        execute ":normal! r" . withAccent[position]
    else
        let position = match(withAccent, character)
        if position != -1
            execute ":normal! r" . withNoAccent[position]
        endif
    endif
endfunction





"NETRW_&_SWITCH_&_OTHER_USEFUL_COMMANDS_________________________________________

command! Squish execute "normal \ggVGgq"
command! Root call root#FindRoot()
command! -nargs=1 ChangeRoot call switch#change_root(<f-args>)
command! ChangeRootCurrent call switch#change_root_current()
command! SwitchDir call switch#switch_dir()
command! Longline call LongLine()
command! ToggleAccent call ToggleAccent()
