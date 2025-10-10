set timeoutlen=500
let g:mapleader = ' '

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

let g:which_key_map = get(g:, 'which_key_map', {})

let g:which_key_map['g'] = { 'name': 'Git' }
let g:which_key_map['s'] = { 'name': 'Search' }
let g:which_key_map['f'] = { 'name': 'Picker' }
let g:which_key_map['b'] = { 'name': 'Buffer' }
let g:which_key_map['b']['o'] = { 'o': 'Close others' }
let g:which_key_map[','] = { 'name': 'Others' }
let g:which_key_map[',']['s'] = { 's': 'Share' }

call which_key#register('<Space>', 'g:which_key_map', 'n')

vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

let g:which_key_map_visual = get(g:, 'which_key_map_visual', {})

let g:which_key_map_visual[','] = { 'name': 'Others' }
let g:which_key_map_visual[',']['s'] = { 'name': 'Share' }

call which_key#register('<Space>', 'g:which_key_map_visual', 'v')

let g:which_key_map['w'] = { 'name': 'Window' }
let g:which_key_map['w']['j'] = [ '<C-w>j', 'Window down' ]
let g:which_key_map['w']['h'] = [ '<C-w>h', 'Window right' ]
let g:which_key_map['w']['l'] = [ '<C-w>l', 'Window left' ]
let g:which_key_map['w']['k'] = [ '<C-w>k', 'Window up' ]
let g:which_key_map['w']['v'] = [ '<C-w>v', 'Window V Split' ]
let g:which_key_map['w']['s'] = [ '<C-w>s', 'Window Split' ]
let g:which_key_map['w']['q'] = [ '<C-w>q', 'Close window' ]
