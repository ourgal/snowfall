vim9script
g:lexima_no_default_rules = 1
lexima#set_default_rules()
lexima#insmode#map_hook('before', '<CR>', '')

def My_cr_function(): string
    if has_key(g:plugs, 'coc.nvim')
        return coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    endif
    return ''
enddef

inoremap <expr> <cr> My_cr_function()
