" Vim config file, let's try to use it as vanilla as possible!
" In the spirit of keeping things minimal, I usually have few plugins, they
" should be more than enough for everything:
"    01 fzf                     https://github.com/junegunn/fzf.vim
"    02 ale                     https://github.com/dense-analysis/ale
"    03 supertab                https://github.com/ervandew/supertab
"    04 auto-pairs              https://github.com/jiangmiao/auto-pairs
"    05 vim-surround            https://github.com/tpope/vim-surround
"    06 vim-multiple-cursors    https://github.com/terryma/vim-multiple-cursors
"    07 vim-easymotion          https://github.com/easymotion/vim-easymotion
"    08 vim-wintabs             https://github.com/zefei/vim-wintabs
"    09 vimwiki                 https://github.com/vimwiki/vimwiki
"    10 landscape               https://github.com/itchyny/landscape.vim
"    11 vim-startify            https://github.com/mhinz/vim-startify

" Since Vim-8 is out, no package manager is needed: just clone the plugins repo
" inside ~/.vim/pack/plugins/start/ and all fold into place.

" Other cute plugins that I do not use anymore:
"    fff                     https://github.com/dylanaraps/fff.vim
"    buftabs                 https://github.com/vim-scripts/buftabs
"    buftabs                 https://github.com/zefei/buftabs
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
set nobackup
set laststatus=2

"set noshowmode
"set noswapfile
"set cursorline
"set scl=no
"set nolist
"set encoding=UTF-8
"set omnifunc=ale#completion#OmniFunc


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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


command! -nargs=* -complete=dir F call Run(<q-args>)
command! -bar RangerChooser call RangeChooser()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


noremap <C-S-h> <C-W><C-<>
noremap <C-S-j> <C-W><C-->
noremap <C-S-k> <C-W><C-+>
noremap <C-S-l> <C-W><C->>
noremap <S-h> <C-W><C-H>
noremap <S-k> <C-W><C-K>
noremap <S-j> <C-W><C-J>
noremap <S-l> <C-W><C-L>
noremap <C-h> :bprev<CR>
noremap <C-l> :bnext<CR>
noremap <leader>q :F<CR>
noremap <leader>f :Files!<CR>
noremap <leader>l :BLines!<CR>
noremap <leader>c :BCommits!<CR>
noremap <F2> :set hlsearch! hlsearch?<CR>
noremap <F3> :setlocal spell! spelllang=en_us<CR>
noremap <F4> <esc>ggVGgq<CR>
"noremap <Tab> :buffers<CR>:buffer<Space>
"noremap <leader>r :RangerChooser<CR>

vmap <C-y> :!xclip -f -sel clip<CR>
nmap <C-p> :-r!xclip -o -sel clip<CR>

nmap <Leader><Leader> <Plug>(easymotion-overwin-f)
nmap <Leader><Leader> <Plug>(easymotion-overwin-f2)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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

" The following two functions were thought to be used inside the statusline to
" show the git-status of the direcory.
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?' ['.l:branchname.']':''
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Plus, if you want Nvim to run with the same configs Vim does, just copy this
" three lines below inside ~/.config/nvim/init.vim

" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc
