vim9script

const minpac_dir = $v .. '/pack/minpac/opt/minpac'
if !isdirectory(minpac_dir)
  silent! execute printf('!git clone https://github.com/k-takata/minpac.git %s', minpac_dir)
endif

call plugpac#Begin({
  status_open: 'vertical',
  verbose: 2,
})

Pack 'k-takata/minpac', {'type': 'opt'}

plugpac#End()
