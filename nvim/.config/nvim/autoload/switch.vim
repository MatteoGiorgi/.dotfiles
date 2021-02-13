let g:switch#rootdir = $HOME
let g:switch#currentdir = expand('%:p:h')


function! switch#RootDir(newroot)
    let g:switch#rootdir = a:newroot
    echo 'Root at:' expand(g:switch#rootdir)
endfunction


function! switch#CurrentRootDir()
    let g:switch#rootdir = expand('%:p:h')
    echo 'Root at:' expand(g:switch#rootdir)
endfunction


function! switch#JumpDir()
    if (g:switch#rootdir ==? g:switch#currentdir)
        let g:switch#currentdir = expand('%:p:h')
        lcd %:p:h
        pwd
    else
        let g:switch#currentdir = g:switch#rootdir
        execute 'lcd' g:switch#rootdir
        pwd
    endif
endfunction
