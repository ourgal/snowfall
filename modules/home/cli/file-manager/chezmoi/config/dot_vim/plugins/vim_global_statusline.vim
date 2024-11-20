" a simple extension display the buffer name of current buffer
function! s:fnstr()
    call g:StlSetPart(10, 'filename: '.bufname(), '', 'filename')
    call g:StlRefresh()
endfunction


" extension that adds mode information"
function! s:modestr()
    let m = mode()
    if m == 'n'
        call g:StlSetPart(0, ' NORMAL ', 'StatusLineTerm', 'mode')
    elseif m == 'i'
        call g:StlSetPart(0, ' INSERT ', 'SpellRare', 'mode')
    elseif m == 'v'
        call g:StlSetPart(0, ' VISUAL ', 'SpellCap', 'mode')
    elseif m == 'V'
        call g:StlSetPart(0, ' V-LINE ', 'Visual', 'mode')
    elseif m == '^V'
        call g:StlSetPart(0, ' V-BLOCK ', 'CurSearch', 'mode')
    endif
    call g:StlRefresh()
endfunction

" extension adds line column information
function! s:lncol()
    let col = virtcol(".")
    let ln = line('.')
    call g:StlSetPart(float2nr(&co * 0.9), ln.':'.col, '', 'linenr')
    call g:StlRefresh()
endfunction

augroup GlobalStl
    autocmd!
    autocmd VimEnter,ModeChanged * call s:modestr()
    autocmd BufEnter * call s:fnstr()
    autocmd CursorHold * call s:lncol()
augroup END
