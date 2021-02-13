function! session#SaveLast()
    call session#DeleteLast()
    mksession $HOME/.config/nvim/session.vim
endfunction


function! session#OpenLast()
    source $HOME/.config/nvim/session.vim
endfunction


function! session#DeleteLast()
    if filereadable('$HOME/.config/nvim/session.vim')
        !rm $HOME/.config/nvim/session.vim
    endif
endfunction
