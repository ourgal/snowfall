vim9script
g:workspace_autocreate = 1
g:workspace_autosave_always = 0
g:workspace_autosave = 0
g:workspace_create_new_tabs = 0  # enabled = 1 (default), disabled = 0
g:workspace_session_directory = $HOME .. '/.local/share/vim/sessions/'
g:workspace_autosave_ignore = ["gitcommit", " ", '/tmp/*']
g:workspace_undodir = $HOME .. '/.local/share/vim/undo/'
g:workspace_session_disable_on_args = 1

autocmd CmdwinEnter,CmdwinLeave * ToggleAutosave
