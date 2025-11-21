nnoremap <buffer> ZZ <cmd>x<cr>
nnoremap <buffer> ZQ <cmd>q!<cr>
augroup commitInNewTab
  autocmd!
  autocmd BufWinEnter <buffer> wincmd L
augroup END
