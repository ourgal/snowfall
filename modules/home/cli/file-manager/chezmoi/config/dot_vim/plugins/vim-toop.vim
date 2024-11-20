"using vim functions
function! Duplicate(string)
    return a:string.a:string
endfun
call toop#mapFunction('Duplicate', "ym")

call toop#mapShell('sort', 'gz')
"
" call toop#mapShell('base64 --decode ', '<leader>,9')
"
" call toop#mapShell('md5sum | cut -d " " -f1 ', '<leader>,5')
