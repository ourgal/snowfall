vim9script

def LinovelReg()
    @n = '"z4yy3j"zpkA,j^j$b"+Riqj$be2k^' # new
    @r = '4yy3jpkA,j^2j$be2k^' # repeat
    @i = '3yy2jpkA,j^j$3bek^' # add image
    @d = '^yejRe^' # rename file
    @x = '$"ap^yiq%%Riq'
enddef

augroup workspaceLinovel
    autocmd!
    autocmd BufRead,BufNewFile ~/workspace/linovel/patches/** LinovelReg()
augroup END

def WikiReg()
    @n = 'o[OC("+pT/"+yt)^"+p' # new
enddef

augroup workspaceWiki
    autocmd!
    autocmd BufRead,BufNewFile ~/workspace/wiki/** WikiReg()
augroup END

def LinovelEpub()
    execute 'g/\[\]{#/:-2,+2d'
    execute 'g/Images/:-2,+2d'
    # execute 'g/^####/:-1,+1d'
    execute 'g/^$/d'
    execute ':%s/^\\//'
    # execute 'g/^:::/d'
enddef
command LinovelEpub LinovelEpub()

def CheckIP()
    match Identifier /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
enddef
command CheckIP CheckIP()
