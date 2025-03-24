vim9script

# Always show the status line
set laststatus=2

# Specify the behavior when switching between buffers
try
set switchbuf=uselast
set showtabline=2
catch
endtry

# Use spaces instead of tabs
set expandtab

# Be smart when using tabs ;)
set smarttab

# 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

# Linebreak on 500 characters
# set lbr
# set tw=500

# set ai #Auto indent
# set si #Smart indent

# cindent see cinkeys cinoptions cinwords
set cindent
set wrap #Wrap lines
set clipboard=unnamed

# Let's save undo info!
set undodir=~/.local/share/vim/undo
set undofile

# Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowritebackup

set noswapfile
# set directory=$HOME/.local/share/vim/swap//

# Set extra options when running in GUI mode
if has("gui_running")
set guioptions-=T
set guioptions-=e
set guioptions-=m
set t_Co=256
set guitablabel=%M\ %t
endif

# Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

# Use Unix as the standard file type
set ffs=unix,dos,mac

# Enable syntax highlighting
syntax enable

# Set regular expression engine automatically
set regexpengine=0

if (has("termguicolors"))
    set termguicolors
endif

# Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

# Ignore case when searching
set ignorecase

# When searching try to be smart about cases
set smartcase

# Highlight search results
set hlsearch

# Makes search act like search in modern browsers
set incsearch

# Don't redraw while executing macros (good performance config)
set lazyredraw

# For regular expressions turn magic on
set magic

# Show matching brackets when text indicator is over them
set showmatch

# How many tenths of a second to blink when matching brackets
set mat=2

# No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

# Properly disable sound on errors on MacVim
if has("gui_macvim")
autocmd GUIEnter * set vb t_vb=
endif

# Add a bit extra margin to the left
set foldcolumn=1

# Set 7 lines to the cursor - when moving vertically using j/k
# set so=9999

# Avoid garbled characters in Chinese language windows OS
$LANG = 'en'
set langmenu=en

# Turn on the Wild menu
set wildmenu

# Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
set wildignore+=.git\*,.hg\*,.svn\*
else
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

# Always show current position
set ruler

# Height of the command bar
set cmdheight=1

# A buffer becomes hidden when it is abandoned
set hid

# Sets how many lines of history VIM has to remember
set history=500

set number relativenumber

# Enable filetype plugins
filetype plugin on
filetype indent on

# Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime


# :W sudo saves the file
# (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

# auto save
set updatetime=500
# au TextChanged <buffer> if &readonly == 0 && filereadable(bufname('%')) | silent write | endif

# cursor style
&t_SI = "\e[6 q"
&t_EI = "\e[2 q"

# fix word
# nnoremap zf 1z=

# toggle captalise
# nnoremap z, mzlblgueh~`z

set nocompatible

set mouse=a
set smoothscroll

set showtabline=1

augroup vimrcQfClose
    autocmd!
    autocmd FileType qf nnoremap <buffer><silent> q :cclose<bar>lclose<CR>
augroup END


set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
set grepformat=%f:%l:%c:%m

set signcolumn=yes

# for gvim
def SimpleBalloon(): string
    return 'Cursor is at line/column: ' .. v:beval_lnum .. '/' .. v:beval_col .. ' in file ' .. bufname(v:beval_bufnr) .. '. Word under cursor is: "' .. v:beval_text .. '"'
enddef
set balloonexpr=SimpleBalloon()
set ballooneval

set guifont=monospace 14

# add space to filename, like gf.
# set isfname+=32

# don't save blank buffer
set sessionoptions-=blank

set foldmethod=marker

# highlight cursor line and column
set cursorline

set scrolloff=5

# centre cursorline
# def CentreCursor(): void
#     const pos = getpos(".")
#     normal! zz
#     setpos(".", pos)
# enddef
#
# autocmd CursorMoved,CursorMovedI * call CentreCursor()

# add src path for find {{{
set path+=src/**
#}}}
