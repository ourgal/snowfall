function! MakeScriptExecutable()
  if getfperm(expand('%')) !~ 'x'
    call system('chmod +x ' . shellescape(expand('%')))
  endif
endfunction

augroup MakeScriptExecutable
    autocmd!
    autocmd BufWritePost *.sh call MakeScriptExecutable()
augroup END
