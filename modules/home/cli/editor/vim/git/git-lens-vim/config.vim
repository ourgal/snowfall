let g:GIT_LENS_ENABLED = v:false
command! ToggleGitLens call ToggleGitLens()
nnoremap <leader>gl <cmd>call ToggleGitLens()<cr>
