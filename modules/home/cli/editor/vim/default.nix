{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      vim.extraConfig = ''
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

        if has("gui_running")
        set guioptions-=T
        set guioptions-=e
        set guioptions-=m
        set t_Co=256
        set guitablabel=%M\ %t
        endif

        set encoding=utf8
        set ffs=unix,dos,mac
        syntax enable

        set regexpengine=0

        if (has("termguicolors"))
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

        set mat=2

        set noerrorbells
        set novisualbell
        set t_vb=
        set tm=500

        if has("gui_macvim")
        autocmd GUIEnter * set vb t_vb=
        endif

        set foldcolumn=1

        let $LANG = "en"
        set langmenu=en

        set wildmenu

        set wildignore=*.o,*~,*.pyc
        if has("win16") || has("win32")
        set wildignore+=.git\*,.hg\*,.svn\*
        else
        set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
        endif

        let &t_SI = "\e[6 q"
        let &t_EI = "\e[2 q"

        set ruler
        set cmdheight=1
        set hid
        set history=500
        set number relativenumber

        filetype plugin on
        filetype indent on

        set autoread
        au FocusGained,BufEnter * checktime

        command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

        set updatetime=500

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
        set sessionoptions-=blank
        set foldmethod=marker
        set cursorline
        set scrolloff=5

        let g:mapleader = " "
        nnoremap <leader>bo <cmd>%bd\|e#\|bd#<CR>
        map <C-j> <C-W>j
        map <C-k> <C-W>k
        map <C-h> <C-W>h
        map <C-l> <C-W>l
        map <silent> \h :noh<cr>
        nnoremap n nzzzv
        nnoremap N Nzzzv
        nnoremap ZZ <cmd>xa<cr>
        nnoremap ZQ <cmd>qa!<cr>
        nnoremap L :bn<CR>
        nnoremap H :bp<CR>
        nnoremap X :bp\|bd #<CR>
        noremap Q @@
        xnoremap / <Esc>/\%V
        nnoremap <c-n> <tab>
        nnoremap <tab> <cmd>tabnext<cr>
        nnoremap <s-tab> <cmd>tab split<cr>
        nnoremap <tab> <cmd>tabclose<cr>

        function FoldWithH()
            if col('.') == 1
                return 'zc'
            else
                return 'h'
            endif
        endfunction

        nnoremap <expr> h FoldWithH()
        cnoremap <expr> %% getcmdtype( ) == ":" ? expand("%:h") .. "/" : "%%"
        nnoremap & <cmd>&&<CR>
        xnoremap & <cmd>'<,'>&&<CR>
        nnoremap <silent> <esc> <cmd>nohlsearch<CR><esc>

        function OpenFileOrURL()
          let cfile = expand("<cfile>")
          if match(cfile, '^https\?://') >= 0
            call system("xdg-open " .. cfile)
          else
            normal! gF
          endif
        endfunction

        nnoremap <silent> gf <cmd>call OpenFileOrURL()<CR>
      '';
    };
    enable = [
      # keep-sorted start
      "ale"
      "bufexplorer"
      "catppuccin-vim"
      "caw-vim"
      "chezmoi-vim"
      "coc-nvim"
      "easyjump-vim"
      "fzf-vim"
      "git-lens-vim"
      "git-messager-vim"
      "lexima-vim"
      "lightline-vim"
      "pangu-vim"
      "parinfer-rust"
      "rainbow"
      "targets-vim"
      "undotree"
      "vim-auto-save"
      "vim-carbon-now-sh"
      "vim-dispatch"
      "vim-easy-align"
      "vim-exchange"
      "vim-floaterm"
      "vim-fugitive"
      "vim-gitgutter"
      "vim-grepper"
      "vim-highlightedyank"
      "vim-latex-live-preview"
      "vim-ledger"
      "vim-matchup"
      "vim-polyglot"
      "vim-qf"
      "vim-repeat"
      "vim-rhubarb"
      "vim-silicon"
      "vim-sneak"
      "vim-snippets"
      "vim-subversive"
      "vim-surround"
      "vim-templates"
      "vim-toop"
      "vim-visual-star-search"
      "vim-which-key"
      "vim-workspace"
      "vim-zoom"
      "vimsuggest"
      "visual-split-vim"
      "vlime"
      "wiki-vim"
      # keep-sorted end
    ];
    dataFiles = {
      "vim/.keep" = "";
    };
  }
)
