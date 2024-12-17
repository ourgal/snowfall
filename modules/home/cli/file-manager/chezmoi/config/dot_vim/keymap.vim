vim9script

# leader key{{{
g:mapleader = " "
#}}}

# Close all the buffers{{{
nnoremap <leader>bo <cmd>%bd\|e#\|bd#<CR>
#}}}

# Smart way to move between windows {{{
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
#}}}

# Disable highlight when <leader><cr> is pressed {{{
map <silent> \h :noh<cr>
#}}}

# Keep search results centred {{{
nnoremap n nzzzv
nnoremap N Nzzzv
#}}}

# exit vim {{{
nnoremap ZZ <cmd>xa<cr>
nnoremap ZQ <cmd>qa!<cr>
#}}}

# no copying when motions {{{
# nnoremap d "_d
# nnoremap D "_D
# xnoremap d "_d
# nnoremap dd "_dd
#
# nnoremap c "_c
# nnoremap C "_C
# xnoremap c "_c
# nnoremap cc "_cc
#
# nnoremap x "_x
# xnoremap x "_x
#}}}

# quick execute last macro {{{
noremap Q @@
#}}}

# search in visual selection {{{
xnoremap / <Esc>/\%V
#}}}

# tabpage keymap {{{
nnoremap <c-n> <tab>
nnoremap <tab> <cmd>tabnext<cr>
nnoremap <s-tab> <cmd>tab split<cr>
nnoremap <tab> <cmd>tabclose<cr>
#}}}

# h for fold {{{
def FoldWithH(): string
    if col('.') == 1
        return 'zc'
    else
        return 'h'
    endif
enddef

nnoremap <expr> h FoldWithH()
#}}}

# some unused keymap {{{
# map <F1> <ESC><cmd>exec "help " .. expand("<cword>")<CR>

# gf open file in a new buffer, or create a new buffer for file.
# nmap gf <cmd>e <cfile><cr>
#}}}

# %% expend to current dir when cmd {{{
cnoremap <expr> %% getcmdtype( ) == ":" ? expand("%:h") .. "/" : "%%"
#}}}

# replace {{{
nnoremap & <cmd>&&<CR>
xnoremap & <cmd>'<,'>&&<CR>
#}}}

# nohlsearch on esc {{{
nnoremap <silent> <esc> <cmd>nohlsearch<CR><esc>
#}}}

def OpenFileOrURL(): void
  var cfile: string = expand("<cfile>")
  if match(cfile, '^https\?://') >= 0
    system('xdg-open ' .. cfile)
  else
    normal! gF
  endif
enddef

nnoremap <silent> gf <ScriptCmd>OpenFileOrURL()<CR>

nnoremap g* :%s/<c-r><c-w>/

nnoremap . ;
