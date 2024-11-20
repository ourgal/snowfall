vim9script

nnoremap <leader>z <cmd>DevdocsFind<cr>

autocmd FileType nix call g:DevdocsOptionsSet({slugs: ['nix']})
autocmd FileType python call g:DevdocsOptionsSet({slugs: ['python~3.12', 'python~3.11']})
