scriptencoding utf8
let g:mapleader = ' '
nnoremap <leader>bo <cmd>%bd\|e#\|bd#<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <silent> \h :noh<cr>
nnoremap ZZ <cmd>xa<cr>
nnoremap ZQ <cmd>qa!<cr>
noremap Q @@
xnoremap / <Esc>/\%V
nnoremap <c-n> <tab>
nnoremap <tab> <cmd>tabnext<cr>
nnoremap <s-tab> <cmd>tab split<cr>
nnoremap <tab> <cmd>tabclose<cr>

function FoldWithH()
    if col('.') == 1
        return 'zc'
    else
        return 'h'
    endif
endfunction

nnoremap <expr> h FoldWithH()
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
