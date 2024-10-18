let g:dispatch_no_maps = 1
autocmd FileType lisp let b:dispatch = 'sbcl --script %'
nmap <leader>.. <cmd>Dispatch<cr>
