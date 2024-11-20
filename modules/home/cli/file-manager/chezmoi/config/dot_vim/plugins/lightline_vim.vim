let g:lightline = {
     \ 'colorscheme': 'catppuccin_macchiato',
     \ 'active': {
     \   'left': [ [ 'mode', 'paste' ],
     \             [ 'readonly', 'filename', 'modified' ] ],
     \   'right': [ [ 'lineinfo' ],
     \              [ 'percent' ],
     \              [ 'zoomed', 'fileformat', 'fileencoding', 'filetype' ] ]
     \ },
     \ 'inactive': {
     \   'left': [ [ 'mode', 'paste' ],
     \             [ 'readonly', 'filename', 'modified' ] ],
     \   'right': [ [ 'lineinfo' ],
     \              [ 'percent' ],
     \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
     \ },
     \ 'component_function': {
     \   'filename': 'LightlineTruncatedFileName',
     \   'zoomed': 'zoom#statusline'
     \ }
     \ }

function! LightlineTruncatedFileName()
let l:filePath = expand('%')
    if winwidth(0) > 100
        return l:filePath
    else
        return pathshorten(l:filePath)
    endif
endfunction
