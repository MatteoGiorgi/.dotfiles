function! line#StatuslineGit()
    let l:branchname = fugitive#head()
    return strlen(l:branchname) > 0?'  '.toupper(l:branchname).' -- ':' '
endfunction


function! line#BufferStatus()
    let l:status = ' '
    if &readonly
        let l:status .= '[x]'
    elseif &modified
        let l:status .= '[+]'
    endif
    return l:status.' '
endfunction


function! line#LineInfo()
    let l:column = virtcol('.')
    let l:line = line('.')
    let l:info = line.','.column
    let l:byte = line2byte( line( '.' ) ) + col( '.' ) - 1
    let l:size = (line2byte( line( '$' ) + 1 ) - 1)
    let l:info .= ' -- '.((byte * 100)/size).'% '
    return l:info
endfunction


function! line#LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK ' : printf(
                \ '%dW,%dE',
                \ all_non_errors,
                \ all_errors
                \ ).' '
endfunction
