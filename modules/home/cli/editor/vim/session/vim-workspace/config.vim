let g:workspace_autocreate = 1
let g:workspace_autosave_always = 0
let g:workspace_autosave = 0
let g:workspace_create_new_tabs = 0
let g:workspace_session_directory = $HOME .. '/.local/share/vim/sessions/'
let g:workspace_autosave_ignore = ['gitcommit', ' ', '/tmp/*']
let g:workspace_undodir = $HOME .. '/.local/share/vim/undo/'
let g:workspace_session_disable_on_args = 1

autocmd CmdwinEnter,CmdwinLeave * ToggleAutosave
