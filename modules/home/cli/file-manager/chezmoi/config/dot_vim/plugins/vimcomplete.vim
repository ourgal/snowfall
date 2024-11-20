vim9script
g:vimcomplete_tab_enable = 1
# var dictproperties = {
#     python: { sortedDict: false },
#     text: { sortedDict: true }
# }
const vcoptions = {
    buffer: { enable: true },
    lsp: { enable: true },
    # vimscript: { enable: true },
    vsnip: { enable: true }
}
autocmd VimEnter * g:VimCompleteOptionsSet(vcoptions)
autocmd FileType text set dictionary+=/usr/share/dict/words
autocmd FileType python set dictionary=$HOME/.vim/data/pythondict
