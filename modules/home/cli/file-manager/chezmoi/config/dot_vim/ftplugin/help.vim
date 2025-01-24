nmap <buffer> <CR> <C-]>
nmap <buffer> <BS> <C-T>
nmap <buffer> o silent! /'[a-z]\{2,\}'<CR>
nmap <buffer> q <cmd>q<cr>

augroup helpInNewTab
  autocmd!
  autocmd BufWinEnter <buffer> wincmd T
augroup END
