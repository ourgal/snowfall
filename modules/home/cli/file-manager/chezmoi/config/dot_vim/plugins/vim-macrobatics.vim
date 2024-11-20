vim9script
# Use <nowait> to override the default bindings which wait for another key press
nnoremap <nowait> Q <plug>(Mac_Play)
nnoremap <nowait> q <plug>(Mac_RecordNew)
nmap [@ <plug>(Mac_RotateBack)
nmap ]@ <plug>(Mac_RotateForward)

nmap <leader>@n <plug>(Mac_NameCurrentMacro)
nmap <leader>@s <plug>(Mac_SearchForNamedMacroAndSelect)

nmap <leader>@A <plug>(Mac_Append)
nmap <leader>@I <plug>(Mac_Prepend)

nmap <leader>@p <plug>(Mac_SearchForNamedMacroAndPlay)

nmap <leader>@u <plug>(Mac_SearchForNamedMacroAndOverwrite)

nmap <leader>@d <plug>(Mac_SearchForNamedMacroAndDelete)

nmap <leader>@r <plug>(Mac_SearchForNamedMacroAndRename)
