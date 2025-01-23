let g:which_key_map = get(g:, 'which_key_map', { 'f': { 'name': 'Picker' }, 'b': { 'name': 'Buffer' }, 's': { 'name': 'Search' }, 'g': { 'name': 'Git' } })
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
let g:which_key_map['*'] = [':RG <c-r><c-w>', 'Live Grep current word']

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
