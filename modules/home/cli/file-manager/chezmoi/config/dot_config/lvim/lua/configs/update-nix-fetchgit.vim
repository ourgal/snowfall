" A helper to preserve the cursor location with filters
function! Preserve(command)
  let w = winsaveview()
  execute a:command
  call winrestview(w)
endfunction

" Update fetcher under cursor, note that this might take a little while if the
" fetched path is large.
autocmd FileType nix map <nowait> <silent> <leader>.u :call Preserve("%!update-nix-fetchgit --location=" . line(".") . ":" . col("."))<CR>
