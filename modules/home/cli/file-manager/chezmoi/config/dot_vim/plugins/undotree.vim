vim9script
if ! has_key(g:plugs, 'vim-which-key')
    nnoremap <leader>u <ScriptCmd>UndotreeToggle<CR>
endif
g:undotree_SetFocusWhenToggle = 1
