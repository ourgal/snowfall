set timeoutlen=500
let g:mapleader = " "

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
let g:which_key_map = {
    \ 'g': { 'name': 'Git' },
    \ 's': { 'name': 'Search' },
    \ 'f': { 'name': 'Picker' },
    \ 'b': { 'name': 'Buffer',
            \ 'o': 'Close others'},
    \ ',': {'name': 'Others',
            \ 's': { 'name': 'Share' }}}

let g:which_key_map['f']['f'] = [':FloatermNew broot', 'Broot']
let g:which_key_map['e'] = [':FloatermNew lf', 'Lf']

let g:which_key_map['g']['g'] = [':tab G', 'Fugitive']

let g:which_key_map[',']['s']['c'] = ['ggVG:CarbonNowSh', 'Carbon']

let g:which_key_map[',']['s']['s'] = [':Silicon', 'Silicon']

let g:which_key_map['f']['g'] = [':GFiles?', 'Git Files Modified']
let g:which_key_map['f']['F'] = [':Files', 'Files']
let g:which_key_map['f']['b'] = [':Buffers', 'Buffers']
let g:which_key_map['b']['f'] = [':Buffers', 'Buffers']
let g:which_key_map['s']['f'] = [':GFiles?', 'Git files']
let g:which_key_map['s']['/'] = [':History/', 'Search history']
let g:which_key_map['s'][':'] = [':History:', 'Command history']
let g:which_key_map['s']['K'] = [':Maps', 'Keymaps']
let g:which_key_map['s']['C'] = [':Commands', 'Commands']
let g:which_key_map['g']['h'] = [':BCommits', 'Commit history']
let g:which_key_map['/'] = [':RG', 'Live grep']

let g:which_key_map['b']['e'] = 'Explorer'
let g:which_key_map['b']['t'] = 'Toggle explorer'
let g:which_key_map['b']['s'] = 'Explorer split'
let g:which_key_map['b']['v'] = 'Explorer vsplit'

call which_key#register('<Space>', 'g:which_key_map', 'n')

vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

let g:which_key_map_visual = {
    \ ',': { 'name': 'Others',
            \ 's': { 'name': 'Share' }}}
let g:which_key_map_visual[',']['s']['c'] = ['gv:CarbonNowSh', 'Carbon']

let g:which_key_map_visual[',']['s']['s'] = ['gv:Silicon', 'Silicon']

call which_key#register('<Space>', 'g:which_key_map_visual', 'v')
