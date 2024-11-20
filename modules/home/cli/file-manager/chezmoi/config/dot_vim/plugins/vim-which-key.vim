vim9script
nnoremap <silent> <leader> <ScriptCmd>WhichKey '<Space>'<CR>
g:which_key_map = {}
# g:which_key_map['@'] = { "name": "Macro" }
g:which_key_map['g'] = { "name": "Git" }
g:which_key_map['s'] = { "name": "Search" }
g:which_key_map['f'] = { "name": "Picker" }
g:which_key_map['b'] = { "name": "Buffer",
'o': 'Close others'
}
g:which_key_map['b'] = { "name": "Buffer",
'o': 'Close others'
}

g:which_key_map[','] = {
    'name': "Others",
    's': { 'name': 'Share' },
}
g:which_key_map[',']['u'] = [':PlugUpdate', "Update packages"]
# g:which_key_map['q'] = [':xall', "Save all and quit"]

if has_key(g:plugs, 'vim-carbon-now-sh')
    g:which_key_map[',']['s']['c'] = ['ggVG:CarbonNowSh', "Carbon"]
endif

if has_key(g:plugs, 'bufexplorer')
    g:which_key_map['b']['e'] = 'Explorer'
    g:which_key_map['b']['t'] = 'Toggle explorer'
    g:which_key_map['b']['s'] = 'Explorer split'
    g:which_key_map['b']['v'] = 'Explorer vsplit'
endif

if has_key(g:plugs, 'vim-silicon')
    g:which_key_map[',']['s']['s'] = [':Silicon', "Silicon"]
endif

if has_key(g:plugs, 'vim-toop')
    g:which_key_map[',']['s']['s'] = [':Silicon', "Silicon"]
endif

g:which_key_map[',']['s']['p'] = [':Share', "Pastebin"]

if has_key(g:plugs, 'vim-pastebins')
    g:which_key_map[',']['s']['p'] = [':PastebinPasteAll', "Pastebin"]
endif

if has_key(g:plugs, 'undotree')
    g:which_key_map['u'] = [':UndotreeToggle', 'Undo Tree']
endif

if has_key(g:plugs, 'vim-macrobatics')
    g:which_key_map['@']['n'] = 'Name current macro'
    g:which_key_map['@']['s'] = 'Select macro'
    g:which_key_map['@']['h'] = [':DisplayMacroHistory', 'Macro history']
    g:which_key_map['@']['I'] = 'Macro prepend'
    g:which_key_map['@']['A'] = 'Macro append'
    g:which_key_map['@']['p'] = 'Select macro and play'
    g:which_key_map['@']['u'] = 'Update macro'
    g:which_key_map['@']['d'] = 'Delete macro'
    g:which_key_map['@']['r'] = 'Rename macro'
endif

if has_key(g:plugs, 'vim-fugitive')
    g:which_key_map['g']['g'] = [':tab G', 'Fugitive']
endif

if has_key(g:plugs, 'fuzzyy')
    g:which_key_map['s']['t'] = [':FuzzyGrep', 'Live grep']
    g:which_key_map['b']['f'] = [':FuzzyBuffers', 'Buffers']
    g:which_key_map['s']['f'] = [':FuzzyGitFiles', 'Git files']
endif

if has_key(g:plugs, 'fzf.vim')
    g:which_key_map['f']['g'] = [':GFiles?', 'Git Files Modified']
    g:which_key_map['f']['F'] = [':Files', 'Files']
    g:which_key_map['f']['b'] = [':Buffers', 'Buffers']
    g:which_key_map['b']['f'] = [':Buffers', 'Buffers']
    g:which_key_map['s']['f'] = [':GFiles?', 'Git files']
    g:which_key_map['s']['/'] = [':History/', 'Search history']
    g:which_key_map['s'][':'] = [':History:', 'Command history']
    g:which_key_map['s']['K'] = [':Maps', 'Keymaps']
    g:which_key_map['s']['C'] = [':Commands', 'Commands']
    g:which_key_map['g']['h'] = [':BCommits', 'Commit history']
    g:which_key_map['/'] = [':RG', 'Live grep']
endif

if has_key(g:plugs, 'coc.nvim')
    g:which_key_map['r'] = [':CocList diagnostics', 'Diagnostics']
    g:which_key_map['o'] = [':CocList outline', 'Outline']
endif

if has_key(g:plugs, 'vim-floaterm')
    g:which_key_map['f']['f'] = [':FloatermNew broot', 'Broot']
    g:which_key_map['e'] = [':FloatermNew lf', 'Lf']
endif

if has_key(g:plugs, 'vim-clap')
    g:which_key_map['s']['t'] = [':Clap grep', 'Live grep']
    g:which_key_map[':'] = [':Clap command_history', 'Command history']
endif

if has_key(g:plugs, 'fzf')
    g:which_key_map['f'] = [":call fzf#run(fzf#wrap({'options': '--preview \"bat --color always {}\"'}))", "Lf"]
endif

which_key#register('<Space>', "g:which_key_map", 'n')


vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
g:which_key_map_visual = {}
g:which_key_map_visual[','] = {
    'name': "Others",
    's': { 'name': 'Share' }
}

if has_key(g:plugs, 'vim-carbon-now-sh')
    g:which_key_map_visual[',']['s']['c'] = ['gv:CarbonNowSh', "Carbon"]
endif

if has_key(g:plugs, 'vim-silicon')
    g:which_key_map_visual[',']['s']['s'] = ["gv:Silicon", "Silicon"]
endif

if has_key(g:plugs, 'vim-pastebins')
    g:which_key_map_visual[',']['s']['p'] = [':PastebinPaste', "Pastebin"]
endif
g:which_key_map_visual[',']['s']['p'] = ['gv:Share', "Pastebin"]

which_key#register('<Space>', "g:which_key_map_visual", 'v')
