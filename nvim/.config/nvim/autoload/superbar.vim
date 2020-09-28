highlight User1 guibg='#BFBFBF' guifg='#343746' gui=BOLD
highlight User2 guibg='#343746' guifg='#BFBFBF' gui=BOLD
highlight User3 guibg='#343746' guifg='#BFBFBF' gui=BOLD
highlight User4 guibg='#BFBFBF' guifg='#343746' gui=BOLD


function! superbar#ActiveStatusLine()
    let l:statusline = ""
    let l:mode = mode()
    let l:statusline  = "%1*\ %{toupper(g:currentmode[mode()])}"
    let l:statusline .= "%<"
    let l:statusline .= "\ "
    let l:statusline .= "%2*\\ "
    let l:statusline .= "%3*\ \ "
    let l:statusline .= "%f"
    let l:statusline .= "\ %="
    let l:statusline .= "\ %{&modified?'\ ':''}"
    let l:statusline .= "%{&readonly?'\ ':''}"
    let l:statusline .= "%2*\ \"
    let l:statusline .= "%1*\ %{&filetype!=#''?&filetype:'none'}"
    let l:statusline .= "%(\ \|%{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'').(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)"
    " let l:statusline .= "%(\ \\ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)"
    let l:statusline .= "\ \"
    let l:statusline .= "%{superbar#rhs()}"
    " let l:statusline .= "\ ℓ\ %{&number?'':printf('%2d,',line('.'))}"
    " let l:statusline .= "%-2v"
    " let l:statusline .= "\ %2p%%"
    let l:statusline .= "\ "
    return l:statusline
endfunction


function! superbar#rhs() abort
    let l:rhs=' '
    if winwidth(0) > 80
        let l:column = virtcol('.')
        let l:width = virtcol('$')
        let l:line = line('.')
        let l:height = line('$')
        
        let l:rhs .= 'ℓ '
        let l:rhs .= l:line
        let l:rhs .= ':'
        let l:rhs .= l:column
        let l:rhs .= ' '
        let l:rhs .= l:line*100/l:height
        let l:rhs .= '%'
    endif
    return l:rhs
endfunction


function! superbar#InactiveStatusLine()
    let l:statusline = ""
    let l:statusline .= "\ \ "
    let l:statusline .= "\ %F"
    let l:statusline .= "\ %="
    let l:statusline .= "%{&modified?'\ ':''}"
    let l:statusline .= "%{&readonly?'\ ':''}"
    let l:statusline .= "\ "
    return l:statusline
endfunction


function! superbar#StatusLine(mode)
    let l:bn = bufname("%")
    if &buftype == "nofile" || &filetype == "netrw" || l:bn == "[BufExplorer]" || l:bn == "undotree_2" || l:bn == "diffpanel_3"
        return
    elseif a:mode == "inactive"
        setlocal statusline=%!superbar#InactiveStatusLine()
    else
        setlocal statusline=%!superbar#ActiveStatusLine()
    endif
endfunction


function! superbar#UpdateInactiveWindows()
    for winnum in range(1, winnr('$'))
        if winnum != winnr()
            call setwinvar(winnum, '&statusline', '%!superbar#InactiveStatusLine()')
        endif
    endfor
endfunction


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
