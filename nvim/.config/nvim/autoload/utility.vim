function! utility#LongLine()
    if (g:longline ==? 'none')
        let g:longline = 'all'
        setlocal virtualedit=all
    else
        let g:longline = 'none'
        setlocal virtualedit=
    endif
endfunction


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


function! utility#StatuslineGit()
    let l:branchname = fugitive#head()
    return strlen(l:branchname) > 0?'  '.toupper(l:branchname).' -- ':' '
endfunction


function! utility#BufferStatus()
    let l:status = ' '
    if &readonly
        let l:status .= '(x)'
    elseif &modified
        let l:status .= '(+)'
    endif
    return l:status.' '
endfunction


function! utility#LineInfo()
    let l:column = virtcol('.')
    let l:line = line('.')
    let l:info = line.','.column
    let l:byte = line2byte( line( '.' ) ) + col( '.' ) - 1
    let l:size = (line2byte( line( '$' ) + 1 ) - 1)
    let l:info .= '          '.((byte * 100)/size).'% '
    return l:info
endfunction


function! utility#NetrwMapping()
    " movements, toggle hidden
    nmap <buffer> h -^
    nmap <buffer> l <CR>
    nmap <buffer> . gh

    " toggle select, remove all selections
    nmap <buffer> <Tab> mf
    nmap <buffer> <Esc> mu

    " create dir, create file, rename, delete, copy, move, execute
    nmap <buffer> dd d
    nmap <buffer> ff %:w<CR>:buffer #<CR>
    nmap <buffer> rr R
    nmap <buffer> DD D
    nmap <buffer> cc mtmc
    nmap <buffer> mm mtmm
    nmap <buffer> xx mx
endfunction


function! utility#TermMapping()
    setlocal nonumber norelativenumber
    tmap <buffer> <leader><Esc> <C-\><C-n><CR>

    " resize windows
    tmap <buffer> <silent><C-h> <C-\><C-n>:vertical resize -5<CR>
    tmap <buffer> <silent><C-l> <C-\><C-n>:vertical resize +5<CR>
    tmap <buffer> <silent><C-j> <C-\><C-n>:resize -5<CR>
    tmap <buffer> <silent><C-k> <C-\><C-n>:resize +5<CR>

    " reorder windows
    tmap <buffer> <leader><M-h> <C-\><C-n>:wincmd<Space><S-h><CR>
    tmap <buffer> <leader><M-l> <C-\><C-n>:wincmd<Space><S-l><CR>
    tmap <buffer> <leader><M-j> <C-\><C-n>:wincmd<Space><S-j><CR>
    tmap <buffer> <leader><M-k> <C-\><C-n>:wincmd<Space><S-k><CR>

    " create and move through windos
    tmap <buffer> <silent><M-k> <C-\><C-n>:new<bar>Startify<CR>
    tmap <buffer> <silent><M-j> <C-\><C-n>:belowright new<bar>Startify<CR>
    tmap <buffer> <silent><M-h> <C-\><C-n>:vnew<bar>Startify<CR>
    tmap <buffer> <silent><M-l> <C-\><C-n>:belowright vnew<bar>Startify<CR>
    tmap <buffer> <silent><M-Space> <C-\><C-n>:wincmd<Space>w<CR>
    tmap <buffer> <silent><M-Backspace> <C-\><C-n>:buffer#<CR>

    " win mode, quit, edit new, delete, close session, terminal
    tmap <buffer> <leader>w <C-\><C-n><C-W>
    tmap <buffer> <leader>q <C-\><C-n>:quit!<CR>
    tmap <buffer> <leader>e <C-\><C-n>:Startify<CR>
    tmap <buffer> <leader>d <C-\><C-n>:Startify<bar>bdelete!#<CR>
    tmap <buffer> <leader>i <C-\><C-n>:SClose<CR>
    tmap <buffer> <leader>t <C-\><C-n>:terminal<CR>

    " move through buffers
    tmap <buffer> <silent><M-Tab> <C-\><C-n>:bnext<CR><C-g>
    tmap <buffer> <leader>1 <C-\><C-n><Plug>BufTabLine.Go(1)
    tmap <buffer> <leader>2 <C-\><C-n><Plug>BufTabLine.Go(2)
    tmap <buffer> <leader>3 <C-\><C-n><Plug>BufTabLine.Go(3)
    tmap <buffer> <leader>4 <C-\><C-n><Plug>BufTabLine.Go(4)
    tmap <buffer> <leader>5 <C-\><C-n><Plug>BufTabLine.Go(5)
    tmap <buffer> <leader>6 <C-\><C-n><Plug>BufTabLine.Go(6)
    tmap <buffer> <leader>7 <C-\><C-n><Plug>BufTabLine.Go(7)
    tmap <buffer> <leader>8 <C-\><C-n><Plug>BufTabLine.Go(8)
    tmap <buffer> <leader>9 <C-\><C-n><Plug>BufTabLine.Go(9)
    tmap <buffer> <leader>0 <C-\><C-n><Plug>BufTabLine.Go(10)
endfunction
