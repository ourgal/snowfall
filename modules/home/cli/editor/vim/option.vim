set laststatus=2

try
set switchbuf=uselast
set showtabline=2
catch
endtry

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

set cindent
set wrap
set clipboard=unnamed

set undodir=~/.local/share/vim/undo
set undofile

set nobackup
set nowritebackup

set noswapfile
" set directory=$HOME/.local/share/vim/swap//

if has('gui_running')
set guioptions-=T
set guioptions-=e
set guioptions-=m
set t_Co=256
set guitablabel=%M\ %t
endif

set encoding=utf8
set fileformats=unix,dos,mac
syntax enable

set regexpengine=0

if (has('termguicolors'))
    set termguicolors
endif

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set hlsearch
set incsearch

set lazyredraw
set magic
set showmatch

set matchtime=2

set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500

set foldcolumn=0

let $LANG = 'en'
set langmenu=en

set wildmenu

set wildignore=*.o,*~,*.pyc
if has('win16') || has('win32')
set wildignore+=.git\*,.hg\*,.svn\*
else
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set ruler
set cmdheight=1
set hidden
set history=500
set number relativenumber

filetype plugin on
filetype indent on

set autoread

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

set updatetime=500

set mouse=a
set smoothscroll

set showtabline=1

augroup settings
    autocmd!
    autocmd FocusGained,BufEnter * checktime
    autocmd FileType qf nnoremap <buffer><silent> q :cclose<bar>lclose<CR>
augroup END

set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
set grepformat=%f:%l:%c:%m

set signcolumn=auto
set sessionoptions-=blank
set foldmethod=marker
set cursorline
set scrolloff=5
