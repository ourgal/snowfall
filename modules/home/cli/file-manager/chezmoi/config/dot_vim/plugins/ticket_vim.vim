vim9script
g:auto_ticket = 1
au BufLeave,CursorHold,FocusLost * if(getbufinfo('%')[0].changed) | do BufWritePre | sil! up | do BufWritePost | endif
