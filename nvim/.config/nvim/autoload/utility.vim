"LONGLINE_______________________________________________________________________

function! utility#LongLine()
    if (g:longline ==? 'none')
        let g:longline = 'all'
        setlocal virtualedit=all
    else
        let g:longline = 'none'
        setlocal virtualedit=
    endif
endfunction




"TOGGLEACCENT___________________________________________________________________

function! utility#ToggleAccent()
    let withAccentGrave = ['à', 'è', 'ì', 'ò', 'ù', 'À', 'È', 'Ì', 'Ò', 'Ù']
    let withAccentAcute = ['á', 'é', 'í', 'ó', 'ú', 'Á', 'É', 'Í', 'Ó', 'Ú']
    let withNoAccent    = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']
    let character = matchstr(getline('.'), '\%' . col('.') . 'c.')
    let positionG = match(withAccentGrave, character)
    let positionA = match(withAccentAcute, character)
    let positionN = match(withNoAccent, character)
    if positionN != -1
        execute ':normal! r' . withAccentGrave[positionN]
    endif
    if positionG != -1
        execute ':normal! r' . withAccentAcute[positionG]
    endif
    if positionA != -1
        execute ':normal! r' . withNoAccent[positionA]
    endif
endfunction




"EASYTERM_______________________________________________________________________

function! utility#EasyTerm(args)
    botright 20new
    exe 'terminal' a:args
    tnoremap <buffer> <Esc> <C-\><C-n>:bdelete!<CR>
    tnoremap <buffer> <expr> <C-v> '<C-\><C-N>pi'
endfun




"STARTPAGE______________________________________________________________________

function! utility#Start()
    " Don't run if: we have commandline arguments, we don't have an empty
    " buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
    if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif
    enew
    setlocal
        \ bufhidden=wipe
        \ buftype=nofile
        \ nobuflisted
        \ nocursorcolumn
        \ nocursorline
        \ nolist
        \ nonumber
        \ noshowmode
        \ noshowcmd
        \ noswapfile
        \ norelativenumber
        \ nowrap
        \ statusline=%!superbar#Silent()
    call append('$', '')
    for line in split(system('cat ~/.config/nvim/startscreen'), '\n')
        call append('$', '    ' . l:line)
    endfor
    setlocal nomodifiable nomodified
    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> q :q<CR>
endfun
