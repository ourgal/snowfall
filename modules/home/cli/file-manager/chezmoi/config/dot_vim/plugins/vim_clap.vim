vim9script
g:clap_plugin_experimental = v:true
# nnoremap <silent><nowait> <leader>f  <ScriptCmd>Clap files<CR>

if ! has_key(g:plugs, 'vim-which-key')
    nnoremap <silent><nowait> <leader>st  <ScriptCmd>Clap grep<CR>
    nnoremap <silent><nowait> <leader>:  <ScriptCmd>Clap command_history<CR>
endif
