vim9script
g:floaterm_opener = 'edit'
g:floaterm_height = 0.999
g:floaterm_width = 0.99

nnoremap <silent> <F12> <ScriptCmd>FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n><ScriptCmd>FloatermToggle<CR>
nnoremap <C-g> <ScriptCmd>FloatermNew lazygit<cr>

command Nnn FloatermNew nnn
command Lf FloatermNew lf
