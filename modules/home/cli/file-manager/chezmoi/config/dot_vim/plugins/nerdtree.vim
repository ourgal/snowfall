vim9script
nmap <leader>e :NERDTreeToggle<cr>
# Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
g:NERDTreeQuitOnOpen = 1
