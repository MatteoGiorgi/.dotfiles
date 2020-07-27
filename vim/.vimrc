" Vim config file, let's try to use it as vanilla as possible!
" In the spirit of keeping things minimal, I usually have few plugins, they
" should be more than enough for everything:
"    fzf                     https://github.com/junegunn/fzf.vim
"    ale                     https://github.com/dense-analysis/ale
"    supertab                https://github.com/ervandew/supertab
"    auto-pairs              https://github.com/jiangmiao/auto-pairs
"    vim-surround            https://github.com/tpope/vim-surround
"    vim-multiple-cursors    https://github.com/terryma/vim-multiple-cursors
"    vim-easymotion          https://github.com/easymotion/vim-easymotion
"    vim-wintabs             https://github.com/zefei/vim-wintabs
"    vimwiki                 https://github.com/vimwiki/vimwiki
"    vim-man                 https://github.com/vim-utils/vim-man
"    landscape               https://github.com/itchyny/landscape.vim
"    vim-startify            https://github.com/mhinz/vim-startify

" Since Vim-8 is out, no package manager is needed: just clone the plugins repo
" inside ~/.vim/pack/plugins/start/ and all fold into place.

" Other cute plugins that I do not use anymore:
"    fff                     https://github.com/dylanaraps/fff.vim
"    buftabs                 https://github.com/vim-scripts/buftabs
"    buftabs                 https://github.com/zefei/buftabs
"    vim-buftabline          https://github.com/ap/vim-buftabline
"    vim-bufferline          https://github.com/bling/vim-bufferline
"    vimtex                  https://github.com/lervag/vimtex
"    python-mode             https://github.com/python-mode/python-mode
"    syntastic               https://github.com/vim-syntastic/syntastic
"    vim-support             https://github.com/WolfgangMehner/vim-support
"    awk-support             https://github.com/WolfgangMehner/awk-support
"    bash-support            https://github.com/WolfgangMehner/bash-support
"    c-support               https://github.com/WolfgangMehner/c-support
"    git-support             https://github.com/WolfgangMehner/git-support


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

set laststatus=2
set statusline=
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%<
set statusline+=\ \|\ %F
set statusline+=\ %{&modified?'+\ ':''}
set statusline+=%{&readonly?'\ ':''}
set statusline+=\ %=
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=%(\ \|%{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
  \.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
set statusline+=%(\ \|\ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
set statusline+=\ \|
set statusline+=\ %{&number?'':printf('%2d,',line('.'))}
set statusline+=%-2v
set statusline+=\ %2p%%
set statusline+=\ 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"set noswapfile
"set cursorline
"set scl=no
"set nolist


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let mapleader = "\<space>"
let g:SuperTabDefaultCompletionType = 'context'
let g:split = get(g:, 'split', '30vnew')
let g:split_direction = get(g:, 'split_direction', 'nosplitbelow nosplitright')
let g:ale_completion_enabled = 1
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:currentmode={
	\ 'n'  : 'Normal',
	\ 'no' : 'N·Operator Pending',
	\ 'v'  : 'Visual',
	\ 'V'  : 'V·Line',
	\ '' : 'V·Block',
	\ 's'  : 'Select',
	\ 'S'  : 'S·Line',
	\ '' : 'S·Block',
	\ 'i'  : 'Insert',
	\ 'R'  : 'Replace',
	\ 'Rv' : 'V·Replace',
	\ 'c'  : 'Command',
	\ 'cv' : 'Vim Ex',
	\ 'ce' : 'Ex',
	\ 'r'  : 'Prompt',
	\ 'rm' : 'More',
	\ 'r?' : 'Confirm',
	\ '!'  : 'Shell',
	\ 't'  : 'Terminal',
	\}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


command! -nargs=* -complete=dir F call Run(<q-args>)
command! -bar RangerChooser call RangeChooser()
command! HandleURL call HandleURL()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


noremap <C-h> <C-W><C-<>
noremap <C-l> <C-W><C->>
noremap <C-j> <C-W><C-->
noremap <C-k> <C-W><C-+>
noremap <S-h> <C-W><C-H>
noremap <S-k> <C-W><C-K>
noremap <S-j> <C-W><C-J>
noremap <S-l> <C-W><C-L>
noremap m :bnext<CR>
noremap , :bprev<CR>
noremap <leader>b :buffers<CR>:buffer<Space>
noremap <leader>d :bdelete<CR>
noremap <leader>e :edit<space>
noremap <leader>s :split<CR>
noremap <leader>v :vsplit<CR>
noremap <leader>nn :enew<CR>
noremap <leader>ns :new<CR>
noremap <leader>nv :vnew<CR>
noremap <leader>ms :Man<space>
noremap <leader>mv :Vman<space>
noremap <leader>q :quit<CR>
noremap <leader>w :write<CR>
noremap <leader>c :!<space>
noremap <leader>f :F<CR>
noremap <leader>r :RangerChooser<CR>
noremap <leader>h :Files!<CR>
noremap <leader>l :BLines!<CR>
noremap <leader>g :BCommits!<CR>
noremap <leader>u :HandleURL<CR>
noremap <F2> :set hlsearch! hlsearch?<CR>
noremap <F3> :setlocal spell! spelllang=en_us<CR>
noremap <F4> <esc>ggVGgq<CR>

vmap <C-y> :!xclip -f -sel clip<CR>
nmap <C-p> :-r!xclip -o -sel clip<CR>

nmap <leader><leader> <Plug>(easymotion-bd-w)
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


function! HandleURL()
    let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
    echo s:uri
    if s:uri != ""
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
