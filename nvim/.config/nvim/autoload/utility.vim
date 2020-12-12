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
    let withAccentGrave   = ["à", "è", "ì", "ò", "ù", "À", "È", "Ì", "Ò", "Ù"]
    let withAccentAcute   = ["á", "é", "í", "ó", "ú", "Á", "É", "Í", "Ó", "Ú"]
    let withNoAccent      = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    let character = matchstr(getline('.'), '\%' . col('.') . 'c.')
    let positionG = match(withAccentGrave, character)
    let positionA = match(withAccentAcute, character)
    let positionN = match(withNoAccent, character)
    if positionN != -1
        execute ":normal! r" . withAccentGrave[positionN]
    endif
    if positionG != -1
        execute ":normal! r" . withAccentAcute[positionG]
    endif
    if positionA != -1
        execute ":normal! r" . withNoAccent[positionA]
    endif
endfunction
