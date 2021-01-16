highlight User1 guibg=#BFBFBF guifg=#1E1F29 gui=bold
highlight User2 guibg=#6699FF guifg=#BFBFBF gui=bold
highlight User3 guibg=#6699FF guifg=#1E1F29 gui=bold
highlight User4 guibg=#3A3C4E guifg=#6699FF gui=bold
highlight User5 guibg=#3A3C4E guifg=#FF79C6 gui=bold
highlight User6 guibg=#3A3C4E guifg=#BFBFBF gui=bold
highlight User7 guibg=#3A3C4E guifg=#626483 gui=bold

function! superbar#ActiveStatusLine()
    let l:statusline  = "%1*"
    let l:statusline .= "%{superbar#StatuslineGit()}"
    let l:statusline .= "\ "
    let l:statusline .= "%2*"
    let l:statusline .= "\ "
    let l:statusline .= "%3*"
    let l:statusline .= "%f"
    let l:statusline .= "\ "
    let l:statusline .= "%4*"
    let l:statusline .= ""
    let l:statusline .= "%5*"
    let l:statusline .= "%{&modified?'\ \ ':''}"
    let l:statusline .= "%{&readonly?'\ \ ':''}"
    let l:statusline .= "%6*"
    let l:statusline .= "%="
    let l:statusline .= "%{&filetype!=#''?&filetype:'none'}"
    let l:statusline .= "%(\ \%{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'').(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)"
    let l:statusline .= "\ "
    let l:statusline .= "%1*"
    let l:statusline .= "\ "
    let l:statusline .= "\ %{superbar#Percent()}%%"
    let l:statusline .= "\ "
    return l:statusline
endfunction


function! superbar#InactiveStatusLine()
    let l:statusline  = "%7*"
    let l:statusline .= "\ "
    let l:statusline .= "%f"
    let l:statusline .= "%{&modified?'\ \ ':''}"
    let l:statusline .= "%{&readonly?'\ \ ':''}"
    let l:statusline .= "%="
    let l:statusline .= "\ "
    return l:statusline
endfunction


function! superbar#StartScreen()
    let l:statusline  = "%7*"
    let l:statusline .= "\ Enjoy TeoVim\  "
    let l:statusline .= "%="
    let l:statusline .= "\ "
    return l:statusline
endfunction


function! superbar#Coq()
    let l:statusline  = "%7*"
    let l:statusline .= "\ Coq\  "
    let l:statusline .= "%="
    let l:statusline .= "\ "
    return l:statusline
endfunction


function! superbar#GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction


function! superbar#StatuslineGit()
  let l:branchname = superbar#GitBranch()
  return strlen(l:branchname) > 0?'   '.l:branchname.'':'   '
endfunction


function! superbar#Percent()
    let byte = line2byte( line( "." ) ) + col( "." ) - 1
    let size = (line2byte( line( "$" ) + 1 ) - 1)
    " return byte . " " . size . " " . (byte * 100) / size
    return (byte * 100) / size
endfunction


function! superbar#rhs() abort
    let l:rhs=''
    if winwidth(0) > 80
        let l:column = virtcol('.')
        let l:width = virtcol('$')
        let l:line = line('.')
        let l:height = line('$')
        let l:rhs .= l:column
    endif
    return l:rhs
endfunction


function! superbar#StatusLine(mode)
    let l:bn = bufname('%')
    if &buftype ==? 'nofile' || &filetype ==? 'netrw' || l:bn ==? '[BufExplorer]' || l:bn ==? 'undotree_2' || l:bn ==? 'diffpanel_3'
        return
    elseif l:bn ==? '__coq_ide__'
        setlocal statusline=%!superbar#Coq()
        return
    elseif a:mode ==? 'inactive'
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
    \ }
