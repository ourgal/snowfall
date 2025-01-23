let g:which_key_map = get(g:, 'which_key_map', { 'g': { 'name': 'Git' } })
let g:which_key_map['g']['V'] = [':Flog', 'Git Log Graph(Flog)']
let g:flog_override_default_mappings = ['gq', 'q']
