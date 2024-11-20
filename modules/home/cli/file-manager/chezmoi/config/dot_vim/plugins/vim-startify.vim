vim9script
g:startify_custom_header = startify#pad(split(system('figlet -w 100 VIM2020'), '\n'))

# def GetUniqueSessionName(): string
#   var path = fnamemodify(getcwd(), ':p')
#   path = empty(path) ? 'no-project' : path
#   var branch = gitbranch#name()
#   branch = empty(branch) ? '' : '-' .. branch
#   return substitute(path, '/', '%', 'g')
# enddef
#
# autocmd User        StartifyReady silent execute 'SLoad '  .. GetUniqueSessionName()
# autocmd VimLeavePre *             silent execute 'SSave! ' .. GetUniqueSessionName()
