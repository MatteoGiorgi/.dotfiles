" Vim config file, let's try to use it as vanilla as possible!
" In the spirit of keeping things minimal, I usually have few plugins, they
" should be more than enough for everything:
"    vim-plug                https://github.com/junegunn/vim-plug
"    fzf                     https://github.com/junegunn/fzf.vim
"    ale                     https://github.com/dense-analysis/ale
"    vim-fugitive            https://github.com/tpope/vim-fugitive
"    goyo.vim                https://github.com/junegunn/goyo.vim
"    limelight.vim           https://github.com/junegunn/limelight.vim
"    supertab                https://github.com/ervandew/supertab
"    auto-pairs              https://github.com/jiangmiao/auto-pairs
"    vim-surround            https://github.com/tpope/vim-surround
"    vim-multiple-cursors    https://github.com/terryma/vim-multiple-cursors
"    vim-easymotion          https://github.com/easymotion/vim-easymotion
"    vim-airline             https://github.com/vim-airline/vim-airline
"    vim-airline-themes      https://github.com/vim-airline/vim-airline-themes
"    vimwiki                 https://github.com/vimwiki/vimwiki
"    vim-man                 https://github.com/vim-utils/vim-man
"    landscape               https://github.com/itchyny/landscape.vim
"    vim-startify            https://github.com/mhinz/vim-startify
"    vim-devicons            https://github.com/ryanoasis/vim-devicons

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf.vim'
    Plug 'dense-analysis/ale'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'ervandew/supertab'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'easymotion/vim-easymotion'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vimwiki/vimwiki'
    Plug 'vim-utils/vim-man'
    Plug 'itchyny/landscape.vim'
    Plug 'mhinz/vim-startify'
    Plug 'ryanoasis/vim-devicons'
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


packloadall

syntax on
color landscape
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


"set noswapfile
"set cursorline
"set scl=no
"set nolist


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let mapleader = "\<space>"
let g:switchcat = 'horizontal'
let g:SuperTabDefaultCompletionType = 'context'
let g:split = get(g:, 'split', '30vnew')
let g:split_direction = get(g:, 'split_direction', 'nosplitbelow nosplitright')
let g:ale_completion_enabled = 1
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:goyo_width=100
let g:goyo_height='80%'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='landscape'
let g:limelight_conceal_ctermfg = 240
let g:startify_files_number = 5
let g:startify_list_order = [
            \ ['   Files:'], 'files',
            \ [' פּ  Dir:'], 'dir',
            \ ['   Sessions:'], 'sessions',
            \ ['   Bookmarks:'], 'bookmarks',
            \ ]
let g:startify_bookmarks = [
            \ '~/.vimrc',
            \ '~/.zshrc',
            \ '~/.bashrc',
            \ '~/.config/qtile/config.py',
            \ '~/.keys.txt'
            \ ]
let g:startify_custom_header = [
            \ '         ________ ++     ________     ',
            \ '        /VVVVVVVV\++++  /VVVVVVVV\     ',
            \ '        \VVVVVVVV/++++++\VVVVVVVV/     ',
            \ '         |VVVVVV|++++++++/VVVVVV/     ',
            \ '         |VVVVVV|++++++/VVVVVV/     ',
            \ '        +|VVVVVV|++++/VVVVVV/+     ',
            \ '      +++|VVVVVV|++/VVVVVV/+++++     ',
            \ '    +++++|VVVVVV|/VVV___++++++++++     ',
            \ '      +++|VVVVVVVVVV/##/ +_+_+_+_     ',
            \ '        +|VVVVVVVVV___ +/#_#,#_#,\     ',
            \ '         |VVVVVVVV/##/+/#/+/#/+/#/     ',
            \ '         |VVVVVV/+/#/+/#/+/#/ /#/     ',
            \ '         |VVVV/++/#/+/#/ /#/ /#/     ',
            \ '         |VV/  /##//##//##//###/     ',
            \ '                  ++     ',
            \ ]


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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


command! -nargs=* -complete=dir F call Run(<q-args>)
command! -bar RangerChooser call RangeChooser()
command! HandleURL call HandleURL()
command! SwitchCat call SwitchCat()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


noremap <C-h> <C-W><C-<>
noremap <C-l> <C-W><C->>
noremap <C-j> <C-W><C-->
noremap <C-k> <C-W><C-+>
noremap <S-h> <C-W><C-H>
noremap <S-k> <C-W><C-K>
noremap <S-j> <C-W><C-J>
noremap <S-l> <C-W><C-L>
noremap <leader>0 :wincmd =<CR>
noremap <leader>r :wincmd r<CR>
noremap <leader>i :SwitchCat<CR>
noremap <leader><esc> :bnext<CR>
noremap <leader><backspace> :bprev<CR>
noremap <leader>b :buffers<CR>:buffer<Space>
noremap <leader>d :bdelete<CR>
noremap <leader>o :wincmd o<CR>
noremap <leader>n :enew<bar> :Startify<CR>
noremap <leader>s :new<bar> :Startify<CR>
noremap <leader>v :vnew<bar> :Startify<CR>
noremap <leader>m :Man<space>
noremap <leader>q :quit<CR>
noremap <leader>z :write<CR>
noremap <leader>t :shell<CR>
noremap <leader>f :F<CR>
noremap <leader>g :RangerChooser<CR>
noremap <leader>h :Files<CR>
noremap <leader>l :BLines<CR>
noremap <leader>c :Commits<CR>
noremap <leader>u :HandleURL<CR>
noremap <leader>y :Goyo<CR>
noremap <F2> :set hlsearch! hlsearch?<CR>
noremap <F3> :setlocal spell! spelllang=en_us<CR>
noremap <F4> :setlocal nowrap!<CR>
noremap <F5> <esc>ggVGgq<CR>

vmap <C-y> :!xclip -f -sel clip<CR>
nmap <C-p> :-r!xclip -o -sel clip<CR>

nmap <leader><leader> <Plug>(easymotion-bd-w)
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


function! SwitchCat()
    if (g:switchcat ==? 'horizontal')
    let g:switchcat = 'vertical'
        :wincmd H
    else
    let g:switchcat = 'horizontal'
        :wincmd K
    endif
endfunction


function! HandleURL()
    let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
    echo s:uri
    if s:uri != ""
        " look at xdg-settings
        silent exec "!nohup xdg-open '".s:uri."' &"
    else
        echo "No URI found in line."
    endif
endfunction


function! OpenFile(...)
    let tmp_file = $XDG_CACHE_HOME

    if !isdirectory(tmp_file)
        let tmp_file = $HOME . "/.cache"
    endif

    let tmp_file .= "/fff/opened_file"
    let tmp_file = fnameescape(tmp_file)
    bd!

    if filereadable(tmp_file)
        let file_data = readfile(tmp_file)
        execute delete(tmp_file)
    else
        return
    endif

    if filereadable(file_data[0])
        execute "e " . file_data[0]
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


" The following function uses ranger file manager as file selector
" I ditch it in favour of his countrepart for fff written above
function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
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
