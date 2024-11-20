vim9script
wilder#setup({'modes': [':', '/', '?']})
wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_palette_theme({
    \ 'highlighter': wilder#basic_highlighter(),
    \ 'highlights': {
    \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
    \ },
    \ 'border': 'rounded',
    \ 'max_height': '75%',
    \ 'min_height': 0,
    \ 'prompt_position': 'top',
    \ 'reverse': 0,
    \ })))

set noincsearch
