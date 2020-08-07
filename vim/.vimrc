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
" Vim config file, let's try to use it as vanilla as possible!
" In the spirit of keeping things minimal, I usually have few plugins, they
" should be more than enough for everything:
"    vim-plug                https://github.com/junegunn/vim-plug
"    fzf                     https://github.com/junegunn/fzf.vim
"    ale                     https://github.com/dense-analysis/ale
"    vim-fugitive            https://github.com/tpope/vim-fugitive
"    goyo.vim                https://github.com/junegunn/goyo.vim
"    limelight.vim           https://github.com/junegunn/limelight.vim
"    vimwiki                 https://github.com/vimwiki/vimwiki
"    supertab                https://github.com/ervandew/supertab
"    nerdcommenter           https://github.com/preservim/nerdcommenter
"    nerdtree                https://github.com/preservim/nerdtree
"    vim-gitgutter           https://github.com/airblade/vim-gitgutter
"    auto-pairs              https://github.com/jiangmiao/auto-pairs
"    vim-surround            https://github.com/tpope/vim-surround
"    vim-multiple-cursors    https://github.com/terryma/vim-multiple-cursors
"    vim-easymotion          https://github.com/easymotion/vim-easymotion
"    vim-airline             https://github.com/vim-airline/vim-airline
"    vim-airline-themes      https://github.com/vim-airline/vim-airline-themes
"    vim-man                 https://github.com/vim-utils/vim-man
"    vim-startify            https://github.com/mhinz/vim-startify
"    vim-devicons            https://github.com/ryanoasis/vim-devicons
"    vim-whitch-key          https://github.com/liuchengxu/vim-which-key
"    vim-fixkey              https://github.com/drmikehenry/vim-fixkey
"    spacegray.vim           https://github.com/ajh17/spacegray.vim

" Since Vim-8 is out, no package manager is needed: you could just clone the
" plugins repo inside ~/.vim/pack/plugins/start/ and all fold into place.

" Other cute plugins that I do not use anymore:
"    fff                     https://github.com/dylanaraps/fff.vim
"    buftabs                 https://github.com/vim-scripts/buftabs
"    buftabs                 https://github.com/zefei/buftabs
"    vim-buftabline          https://github.com/ap/vim-buftabline
"    vim-bufferline          https://github.com/bling/vim-bufferline
"    vim-wintabs             https://github.com/zefei/vim-wintabs
"    ranger.vim              https://github.com/rafaqz/ranger.vim
"    vimtex                  https://github.com/lervag/vimtex
"    python-mode             https://github.com/python-mode/python-mode
"    syntastic               https://github.com/vim-syntastic/syntastic
"    vim-support             https://github.com/WolfgangMehner/vim-support
"    awk-support             https://github.com/WolfgangMehner/awk-support
"    bash-support            https://github.com/WolfgangMehner/bash-support
"    c-support               https://github.com/WolfgangMehner/c-support
"    git-support             https://github.com/WolfgangMehner/git-support
"    vim-pandoc              https://github.com/vim-pandoc/vim-pandoc
"    vim-pandoc-syntax       https://github.com/vim-pandoc/vim-pandoc-syntax
"    vim-pandoc-after        https://github.com/vim-pandoc/vim-pandoc-after
"    vim-wtf                 https://github.com/sstallion/vim-wtf
"    disco.vim               https://github.com/jsit/disco.vim
"    gruvbox                 https://github.com/gruvbox-community/gruvbox
"    landscape               https://github.com/itchyny/landscape.vim
"    nerdtree-git-plugin     https://github.com/Xuyuanp/nerdtree-git-plugin


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


call plug#begin('~/.vim/plugged')

    " ui
    Plug 'ajh17/spacegray.vim'
    Plug 'preservim/nerdtree'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-airline/vim-airline' |
                \ Plug 'vim-airline/vim-airline-themes'

    "editor
    Plug 'mhinz/vim-startify'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf.vim'
    Plug 'dense-analysis/ale'
    Plug 'ervandew/supertab'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'easymotion/vim-easymotion'
    Plug 'preservim/nerdcommenter'
    Plug 'vim-utils/vim-man'
    Plug 'liuchengxu/vim-which-key'
    Plug 'drmikehenry/vim-fixkey'

    " writer
    Plug 'vimwiki/vimwiki'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'

    " last
    Plug 'ryanoasis/vim-devicons'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


packloadall

syntax on
color spacegray
hi Normal ctermbg=NONE
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

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set runtimepath+=~/.vim_runtime
set clipboard=unnamedplus
set number relativenumber
set mouse=a
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set omnifunc=syntaxcomplete#Complete
set t_Co=256
set hlsearch
set colorcolumn=81
set wrap
set textwidth=80
set linebreak
set wildmode=list:longest,list:full
set encoding=UTF-8
set nobackup
set noshowmode
set noerrorbells
set timeoutlen=500


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"set laststatus=2
"set statusline=
"set statusline+=\ %{toupper(g:currentmode[mode()])}
"set statusline+=%<
"set statusline+=\ \|\ %F
"set statusline+=\ %{&modified?'+\ ':''}
"set statusline+=%{&readonly?'\ ':''}
"set statusline+=\ %=
"set statusline+=\ %{&filetype!=#''?&filetype:'none'}
"set statusline+=%(\ \|%{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
"  \.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
"set statusline+=%(\ \|\ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
"set statusline+=\ \|
"set statusline+=\ %{&number?'':printf('%2d,',line('.'))}
"set statusline+=%-2v
"set statusline+=\ %2p%%
"set statusline+=\ 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"set nocompatible
"set noswapfile
"set cursorline
"set scl=no
"set nolist


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:mapleader = "\<space>"
let g:maplocalleader = ','
let g:switchedit = 'horizontal'
let g:switchdir = 'home'
let g:longline = 'none'
let g:SuperTabDefaultCompletionType = 'context'
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:ale_completion_enabled = 1
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:goyo_width=100
let g:goyo_height='80%'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='distinguished'
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
            \ '~/.keys.txt'
            \ ]
let g:startify_custom_header = [
            \ '         ██▒   █▓ ██▓ ███▄ ▄███▓ ',
            \ '        ▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ',
            \ '         ▓██  █▒░▒██▒▓██    ▓██░ ',
            \ '          ▒██ █░░░██░▒██    ▒██ ',
            \ '           ▒▀█░  ░██░▒██▒   ░██▒ ',
            \ '           ░ ▐░  ░▓  ░ ▒░   ░  ░ ',
            \ '           ░ ░░   ▒ ░░  ░      ░ ',
            \ '             ░░   ▒ ░░      ░ ',
            \ '              ░   ░         ░ ',
            \ '             ░ ',
            \ ]
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'default', 'ext': '.wiki'}]
let g:which_key_map =  {}
let g:which_key_map['w'] = {
            \ 'name' : '+windows' ,
            \ 'b' : [':buffers<CR>:buffer<Space>' , ''],
            \ 'd' : [':bdelete<CR>' , ''],
            \ 'o' : [':wincmd o<CR>' , ''],
            \ 'n' : [':enew<bar> :Startify<CR>' , ''],
            \ 's' : [':new<bar> :Startify<CR>' , ''],
            \ 'v' : [':vnew<bar> :Startify<CR>' , ''],
            \ 'm' : [':Man<space>' , ''],
            \ 'q' : [':quit<CR>' , ''],
            \ 'z' : [':write<CR>' , ''],
            \ 'x' : [':shell<CR>' , ''],
            \ 'f' : [':RangerChooser<CR>' , ''],
            \ 't' : [':NERDTree<CR>' , ''],
            \ 'c' : ['<Plug>NERDCommenterToggle<CR>' , ''],
            \ 'h' : [':Files<CR>' , ''],
            \ 'l' : [':BLines<CR>' , ''],
            \ 'g' : [':Commits<CR>' , ''],
            \ 'u' : [':HandleURL<CR>' , ''],
            \ 'y' : [':Goyo<CR>' , ''],
            \ 'p' : [':setlocal nowrap!<CR>' , ''],
            \ 'r' : [':wincmd r<CR>' , ''],
            \ 'e' : [':SwitchEdit<CR>' , ''],
            \ 'i' : [':SwitchDir<CR>' , ''],
            \ '0' : [':wincmd =<CR>' , ''],
            \ '1' : [':w! \| !comp <c-r>%<CR><CR>' , ''],
            \ '2' : [':!opout <c-r>%<CR><CR>' , ''],
            \ '3' : [':set hlsearch! hlsearch?<CR>' , ''],
            \ '4' : [':setlocal spell! spelllang=en_us<CR>' , ''],
            \ '5' : [':LongLine<CR>' , ''],
            \ '6' : ['<esc>ggVGgq<CR>' , ''],
            \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"let g:currentmode={
"	\ 'n'  : 'Normal',
"	\ 'no' : 'N·Operator Pending',
"	\ 'v'  : 'Visual',
"	\ 'V'  : 'V·Line',
"	\ '' : 'V·Block',
"	\ 's'  : 'Select',
"	\ 'S'  : 'S·Line',
"	\ '' : 'S·Block',
"	\ 'i'  : 'Insert',
"	\ 'R'  : 'Replace',
"	\ 'Rv' : 'V·Replace',
"	\ 'c'  : 'Command',
"	\ 'cv' : 'Vim Ex',
"	\ 'ce' : 'Ex',
"	\ 'r'  : 'Prompt',
"	\ 'rm' : 'More',
"	\ 'r?' : 'Confirm',
"	\ '!'  : 'Shell',
"	\ 't'  : 'Terminal',
"	\}
"let g:split = get(g:, 'split', '30vnew')
"let g:split_direction = get(g:, 'split_direction', 'nosplitbelow nosplitright')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


command! HandleURL call HandleURL()
command! SwitchEdit call SwitchEdit()
command! SwitchDir call SwitchDir()
command! LongLine call LongLine()
command! -bar RangerChooser call RangeChooser()
"command! -nargs=* -complete=dir F call Run(<q-args>)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


noremap <C-h> <C-W><C-<>
noremap <C-l> <C-W><C->>
noremap <C-j> <C-W><C-->
noremap <C-k> <C-W><C-+>
noremap <S-h> <C-W><C-H>
noremap <S-k> <C-W><C-K>
noremap <S-j> <C-W><C-J>
noremap <S-l> <C-W><C-L>
noremap <M-h> :bprev<CR>
noremap <M-l> :bnext<CR>
noremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
noremap <silent><localleader> :<c-u>WhichKey ','<CR>
noremap <leader>b :buffers<CR>:buffer<Space>
noremap <leader>d :bdelete<CR>
noremap <leader>o :wincmd o<CR>
noremap <leader>n :enew<bar> :Startify<CR>
noremap <leader>s :new<bar> :Startify<CR>
noremap <leader>v :vnew<bar> :Startify<CR>
noremap <leader>m :Man<space>
noremap <leader>q :quit<CR>
noremap <leader>z :write<CR>
noremap <leader>x :shell<CR>
noremap <leader>f :RangerChooser<CR>
noremap <leader>t :NERDTree<CR>
noremap <leader>h :Files<CR>
noremap <leader>l :BLines<CR>
noremap <leader>g :Commits<CR>
noremap <leader>u :HandleURL<CR>
noremap <leader>y :Goyo<CR>:hi Normal ctermbg=NONE<CR>
noremap <leader>p :setlocal nowrap!<CR>
noremap <leader>r :wincmd r<CR>
noremap <leader>e :SwitchEdit<CR>
noremap <leader>i :SwitchDir<CR>
noremap <leader>0 :wincmd =<CR>
noremap <leader>1 :w! \| !comp <c-r>%<CR><CR>
noremap <leader>2 :!opout <c-r>%<CR><CR>
noremap <leader>3 :set hlsearch! hlsearch?<CR>
noremap <leader>4 :setlocal spell! spelllang=en_us<CR>
noremap <leader>5 :GitGutterToggle<CR>
noremap <leader>6 :LongLine<CR>
noremap <leader>7 <esc>ggVGgq<CR>

map <leader>c <Plug>NERDCommenterToggle<CR>
nmap <leader><leader> <Plug>(easymotion-bd-w)
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)
nmap <M-j> <Plug>(GitGutterNextHunk)
nmap <M-k> <Plug>(GitGutterPrevHunk)

nmap <C-p> :-r!xclip -o -sel clip<CR>
vmap <C-y> :!xclip -f -sel clip<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


function! LongLine()
    if (g:longline ==? 'none')
        let g:longline = 'all'
        :setlocal virtualedit=all
    else
        let g:longline = 'none'
        :setlocal virtualedit=
    endif
endfunction


function! SwitchDir()
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


function! SwitchEdit()
    if (g:switchedit ==? 'horizontal')
        let g:switchedit = 'vertical'
        :wincmd H
    else
        let g:switchedit = 'horizontal'
        :wincmd K
    endif
endfunction


function! HandleURL()
    let s:uri = matchstr(getline('.'), '[a-z]*:\/\/[^ >,;]*')
    echo s:uri
    if s:uri !=? ''
        " look at xdg-settings
        silent exec "!nohup xdg-open '".s:uri."' &"
    else
        echo 'No URI found in line.'
    endif
endfunction


function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has('gui_running')
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              NOT USED ANYMORE                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" The following two functions use fff file manager (located in ~/bin)
" as a file selector, but I ditch it in favour of RangerChooser + NERDTree
function! OpenFile(...)
    let tmp_file = $XDG_CACHE_HOME

    if !isdirectory(tmp_file)
        let tmp_file = $HOME . '/.cache'
    endif

    let tmp_file .= '/fff/opened_file'
    let tmp_file = fnameescape(tmp_file)
    bd!

    if filereadable(tmp_file)
        let file_data = readfile(tmp_file)
        execute delete(tmp_file)
    else
        return
    endif

    if filereadable(file_data[0])
        execute 'e ' . file_data[0]
    endif
endfunction


function! Run(command)
    execute 'setlocal' . ' ' . g:split_direction
    execute g:split
    execute 'setlocal nonumber'
    execute 'setlocal norelativenumber'

    if has('nvim')
        call termopen('fff -p ' . a:command,
                    \ {'on_exit': function('open_file') })
        startinsert
    else
        let buffer = term_start([&shell, &shellcmdflag, 'fff -p ' . a:command],
                    \ {'curwin': 1, 'exit_cb': function('OpenFile')})

        if !has('patch-8.0.1261')
            call term_wait(buffer, 20)
        endif
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" The following two functions were thought to be used inside the statusline to
" show the git-status of the direcory, plus file size and permissions.
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?' ['.l:branchname.']':''
endfunction

function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
        let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
        let mbytes = kbytes / 1000
    endif
    if bytes <= 0
        return '0'
    endif
    if (exists('mbytes'))
        return mbytes . 'MB '
    elseif (exists('kbytes'))
        return kbytes . 'KB '
    else
        return bytes . 'B '
    endif
endfunction

function! ReadOnly()
    if &readonly || !&modifiable
        return ''
    else
        return ''
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Plus, if you want Nvim to run with the same configs Vim does, just copy this
" three lines below inside ~/.config/nvim/init.vim

" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc
