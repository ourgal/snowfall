vim9script
g:auto_save = true
g:auto_save_silent = true

if has_key(g:plugs, 'lsp')
    g:auto_save_presave_hook = 'LspFormat'
endif
