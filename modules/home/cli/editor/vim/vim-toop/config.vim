function! Duplicate(string)
    return a:string.a:string
endfun
call toop#mapFunction('Duplicate', "ym")

call toop#mapShell('sort', 'gz')
