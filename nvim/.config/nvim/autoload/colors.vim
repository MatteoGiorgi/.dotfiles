function! colors#LoadColors()
    let g:step_colors = split(globpath('$HOME/.config/nvim','colors/*.vim'),'\n')
endfunction


function! colors#StepColorBy( count )
    if !exists('g:step_colors')
        call colors#LoadColors()
    endif
    if exists('g:color_step')
        let g:color_step = (g:color_step + a:count) % len(g:step_colors)
    else
        let g:color_step = 0
    endif
    silent exe 'colorscheme ' . split(g:step_colors[g:color_step], '/')[-1][:-5]
    call colors#PrintColorscheme()
endfunction


function! colors#StepColorNext()
    call colors#StepColorBy( 1 )
endfunction


function! colors#StepColorPrev()
    call colors#StepColorBy( -1 )
endfunction


function! colors#PrintColorscheme()
    redraw
    echo g:step_colors[g:color_step]
endfunction
