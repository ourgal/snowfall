vim9script
g:GIT_LENS_ENABLED = false
command! ToggleGitLens call ToggleGitLens()
nnoremap <leader>gl <ScriptCmd>call ToggleGitLens()<cr>
