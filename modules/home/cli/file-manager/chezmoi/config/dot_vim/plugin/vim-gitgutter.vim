" Author        : zxc
" Created       : 31/07/2024
" License       : MIT
" Description   :

vim9script
g:gitgutter_map_keys = 0
nnoremap <leader>gs <Plug>(GitGutterStageHunk)
nnoremap <leader>gu <Plug>(GitGutterUndoHunk)
nnoremap <leader>gz <cmd>GitGutterFold<cr>
