let g:which_key_map = get(g:, 'which_key_map', { 'b': { 'name': 'Buffer' } })
let g:which_key_map['b']['e'] = [ ':BufExplorer', 'Explorer' ]
let g:which_key_map['b']['t'] = [ 'ToggleBufExplorer', 'Toggle explorer' ]
let g:which_key_map['b']['s'] = [ 'BufExplorerHorizontalSplit', 'Explorer split' ]
let g:which_key_map['b']['v'] = [ 'BufExplorerVerticalSplit', 'Explorer vsplit' ]
