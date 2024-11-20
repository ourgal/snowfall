vim9script

var denops = expand("~/.cache/vim/dvpm/github.com/vim-denops/denops.vim")
if !isdirectory(denops)
  execute 'silent! !git clone https://github.com/vim-denops/denops.vim ' .. denops
endif
execute 'set runtimepath^=' .. substitute(fnamemodify(denops, ':p'), '[/\\]$', '', '')
