scriptencoding utf8
let g:mapleader = ' '
nnoremap <leader>bo <cmd>%bd\|e#\|bd#<CR>
map <silent> \h :noh<cr>
noremap Q @@
xnoremap / <Esc>/\%V
nnoremap ZQ <cmd>qa!<cr>
nnoremap ZX <cmd>xa!<cr>

cnoremap <expr> %% getcmdtype( ) == ":" ? expand("%:h") .. "/" : "%%"
nnoremap & <cmd>&&<CR>
xnoremap & <cmd>'<,'>&&<CR>
nnoremap <silent> <esc> <cmd>nohlsearch<CR><esc>

function OpenFileOrURL()
  let cfile = expand('<cfile>')
  if match(cfile, '^https\?://') >= 0
    call system('xdg-open ' . cfile)
  else
    normal! gF
  endif
endfunction

nnoremap <silent> gf <cmd>call OpenFileOrURL()<CR>

nnoremap g* :%s/<c-r><c-w>/

nnoremap . ;
