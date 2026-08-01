let g:dispatch_no_maps = 0
autocmd FileType lisp let b:dispatch = 'sbcl --script %'
nnoremap <leader>cc <cmd>Make<cr>
