scriptencoding utf8
function LinovelReg() abort
    @n = '"z4yy3j"zpkA,j^j$b"+riqj$be2k^' # new
    @r = '4yy3jpkA,j^2j$be2k^' # repeat
    @i = '3yy2jpkA,j^j$3bek^' # add image
    @d = '^yejre^' # rename file
    @x = '$"ap^yiq%%riq'
endfunction

augroup workspaceLinovel
    autocmd!
    autocmd BufRead,BufNewFile ~/workspace/linovel/patches/** LinovelReg()
augroup END

function WikiReg() abort
    let @n = 'o[OC("+pT/"+yt)^"+p'
endfunction

augroup workspaceWiki
    autocmd!
    autocmd BufRead,BufNewFile ~/workspace/wiki/** WikiReg()
augroup END

function LinovelEpub() abort
    execute 'g/\[\]{#/:-2,+2d'
    execute 'g/Images/:-2,+2d'
    execute 'g/^$/d'
    execute ':%s/^\\//'
endfunction
command LinovelEpub LinovelEpub()

function CheckIP()
    match Identifier /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
endfunction
command CheckIP CheckIP()
