scriptencoding utf-8
function LinovelReg()
    call setreg('n', '"z4yy3j"zpkA,j^j$b"+Riqj$be2k^') " new
    call setreg('r', '4yy$%pkA,3j2k') " repeat
    call setreg('i', '3yy2jpkA,j^j$3bek^') " add image
    call setreg('d', '^yejRe^') " rename file
    call setreg('x', '$"ap^yiq%%Riq')
endfunction

augroup workspaceLinovel
    autocmd!
    autocmd BufRead,BufNewFile ~/workspace/linovel/patches/** call LinovelReg()
augroup END

function WikiReg()
    call setreg('n', 'o[OC("+pT/"+yt)^"+p')
endfunction

augroup workspaceWiki
    autocmd!
    autocmd BufRead,BufNewFile ~/workspace/wiki/** call WikiReg()
augroup END

function LinovelEpub()
    execute 'g/\[\]{#/:-2,+2d'
    execute 'g/Images/:-2,+2d'
    " execute 'g/^####/:-1,+1d'
    execute 'g/^$/d'
    execute ':%s/^\\//'
    " execute 'g/^:::/d'
endfunction
command LinovelEpub call LinovelEpub()

function CheckIP()
    match Identifier /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
endfunction
command CheckIP call CheckIP()
