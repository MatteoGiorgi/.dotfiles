function! maps#NetrwMapping()
    " movements, toggle hidden
    nmap <buffer> h -^
    nmap <buffer> l <CR>
    nmap <buffer> . gh

    " toggle select, remove all selections
    nmap <buffer> <Tab> mf
    nmap <buffer> <Esc> mu

    " create dir, create file, rename, delete, copy, move, execute
    nmap <buffer> <leader>d d
    nmap <buffer> <leader>f %:w<CR>:buffer #<CR>
    nmap <buffer> <leader>r R
    nmap <buffer> <leader>D D
    nmap <buffer> <leader>c mtmc
    nmap <buffer> <leader>m mtmm
    nmap <buffer> <leader>x mx
endfunction


function! maps#TermMapping()
    setlocal nonumber norelativenumber
    tmap <buffer> <leader><Esc> <C-\><C-n><CR>

    " resize windows
    tmap <buffer> <silent><C-h> <C-\><C-n>:vertical resize -5<CR>
    tmap <buffer> <silent><C-l> <C-\><C-n>:vertical resize +5<CR>
    tmap <buffer> <silent><C-j> <C-\><C-n>:resize -5<CR>
    tmap <buffer> <silent><C-k> <C-\><C-n>:resize +5<CR>

    " reorder windows
    tmap <buffer> <silent><M-H> <C-\><C-n>:wincmd<Space>H<CR>
    tmap <buffer> <silent><M-L> <C-\><C-n>:wincmd<Space>L<CR>
    tmap <buffer> <silent><M-J> <C-\><C-n>:wincmd<Space>J<CR>
    tmap <buffer> <silent><M-K> <C-\><C-n>:wincmd<Space>K<CR>

    " create and move through windos
    tmap <buffer> <silent><M-h> <C-\><C-n>:call utility#WinMove('h')<CR>
    tmap <buffer> <silent><M-j> <C-\><C-n>:call utility#WinMove('j')<CR>
    tmap <buffer> <silent><M-k> <C-\><C-n>:call utility#WinMove('k')<CR>
    tmap <buffer> <silent><M-l> <C-\><C-n>:call utility#WinMove('l')<CR>

    " win mode, quit, edit new, delete, close session, terminal
    tmap <buffer> <leader>q <C-\><C-n>:quit!<CR>
    tmap <buffer> <leader>e <C-\><C-n>:enew<CR>
    tmap <buffer> <leader>d <C-\><C-n>:Bclose!<CR>
    tmap <buffer> <leader>i <C-\><C-n>:wa<bar>bufdo<space>bd<bar>Dashboard<CR>
    tmap <buffer> <leader>t <C-\><C-n>:terminal<CR>

    " move through buffers
    tmap <buffer> <silent><M-Tab> <C-\><C-n>:bnext<CR><C-g>
    tmap <buffer> <silent><M-Backspace> <C-\><C-n>:buffer#<CR>

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
