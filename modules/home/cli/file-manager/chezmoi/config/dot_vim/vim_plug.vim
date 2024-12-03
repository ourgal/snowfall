vim9script

# install vim-plug {{{
if empty(glob($v .. '/autoload/plug.vim'))
  silent execute '!curl -fLo ' .. $v .. '/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | import $MYVIMRC
endif

set nocompatible

const installDir = $HOME .. '/.local/share/vim/plugged/'
#}}}

g:polyglot_disabled = ['markdown']

# plugins {{{
plug#begin(installDir)
    Plug 'liuchengxu/vim-which-key' #, { 'on': ['WhichKey', 'WhichKey!'] }
    Plug 'sheerun/vim-polyglot' # syntax highlight
    Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' } # undo history viewer
    Plug 'cohama/lexima.vim' # auto pair, auto close
    Plug 'tyru/caw.vim', { 'on': '<Plug>(caw:hatpos:toggle)' } # comment
    # Plug 'mhinz/vim-signify' # column hint
    Plug 'airblade/vim-gitgutter' # git column hint
    Plug 'thaerkh/vim-workspace' # session manager
    Plug 'svermeulen/vim-subversive', { 'on': '<plug>(SubversiveSubstitute)' } # repalce motion
    # Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'neoclide/coc.nvim', {'branch': 'release'} # lsp support
    # Plug 'ghifarit53/tokyonight-vim' # theme
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }
    Plug 'hotoo/pangu.vim', { 'for': ['markdown', 'vimwiki', 'text'] } # add space between chinese and others
    Plug 'voldikss/vim-floaterm', { 'on': [ 'FloatermToggle', 'FloatermNew' ] }
    Plug 'wellle/targets.vim' # textobj
    Plug 'luochen1990/rainbow' # rainbow brackets
    Plug 'machakann/vim-highlightedyank' # yank highlight

    Plug 'tpope/vim-rhubarb' | Plug 'tpope/vim-fugitive' # Git
    Plug 'tibabit/vim-templates' # templates

    # Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } # markdown syntax

    Plug 'girishji/vimsuggest' # cmd/search autocompletion

    # Plug 'justinmk/vim-sneak', { 'on': ['<Plug>Sneak_s', '<Plug>Sneak_S', '<Plug>Sneak_f', '<Plug>Sneak_F', '<Plug>Sneak_t', '<Plug>Sneak_T'] } # jump motion

    Plug 'kristijanhusak/vim-carbon-now-sh', { 'on': 'CarbonNowSh' } # share codes
    Plug 'segeljakt/vim-silicon', { 'on': 'Silicon' } # share codes

    Plug 'tpope/vim-repeat' #, { 'on': ['<Plug>(RepeatDot)', '<Plug>(RepeatUndo)', '<Plug>(RepeatUndoLine)', '<Plug>(RepeatRedo)'] } # dot repeat

    Plug 'itchyny/lightline.vim' # status bar
    Plug 'junegunn/fzf.vim', { 'commit': '04bfa8115716f9222fe307303f9803e7264ac303', 'on': ['RG', 'Files', 'GFiles', 'Buffers', 'Colors', 'Ag', 'Rg', 'Lines', 'BLines', 'Tags', 'BTags', 'Changes', 'Marks', 'Jumps', 'Windows', 'Locate', 'History', 'Snippets', 'Commits', 'BCommits', 'Commands', 'Maps', 'Helptags', 'Filetypes'] }
    # Plug 'pearofducks/ansible-vim' # replaced by vim-polyglot
    # Plug 'ptzz/lf.vim' #, { 'on': ['Lf', 'Lfcd', 'Lflcd', 'LfCurrentFile', 'LfCurrentDirectory', 'LfWorkingDirectory', 'LfNewTab', 'LfCurrentFileNewTab', 'LfCurrentDirectoryNewTab', 'LfWorkingDirectoryNewTab', 'LfCurrentFileExistingOrNewTab', 'LfCurrentDirectoryExistingOrNewTab', 'LfWorkingDirectoryExistingOrNewTab'] } # lf integration
    Plug 'jlanzarotta/bufexplorer', { 'on': ['BufExplorer', 'ToggleBufExplorer', 'BufExplorerHorizontalSplit', 'BufExplorerVerticalSplit'] }
    # Plug 'KabbAmine/zeavim.vim', { 'on': ['<Plug>Zeavim', '<Plug>ZVVisSelection', '<Plug>ZVOperator', '<Plug>ZVKeyDocset', 'Zeavim', 'ZeavimV'] }
    Plug 'lervag/wiki.vim' # note taking
    Plug 'mhinz/vim-grepper', { 'on': ['Grepper', 'GrepperGit', 'GrepperAg', 'GrepperRg', '<plug>(GrepperOperator)'] } # grep
    # Plug 'romainl/vim-cool' # auto nohl
    Plug 'ledger/vim-ledger', { 'for': 'ledger' }
    Plug '4513ECHO/vim-snipewin', { 'on': '<Plug>(snipewin)' } # window jumper
    # Plug 'superDross/ticket.vim' # session manager
    Plug 'romainl/vim-qf', { "on": ['<Plug>(qf_qf_toggle)', '<Plug>(qf_previous_file)', '<Plug>(qf_next_file)'] } # quickfix enhance
    # Plug 'vim-utils/vim-man', { 'on': 'Man', 'for': 'man' } # for  man page
    # Plug 'christoomey/vim-tmux-navigator'
    # Plug 'sunaku/tmux-navigate'

    # Plug 'Donaldttt/vim-global-statusline' # statusline
    # Plug 'sefeng211/vim-pastebins', { 'on': [ 'PastebinPaste', 'PastebinPasteAll' ] } # share code not copy to clipboard
    # Plug 'svermeulen/vim-cutlass' # nocopy
    # Plug 'ap/vim-buftabline' # bufferline
    # Plug 'roxma/nvim-yarp' | Plug 'roxma/vim-hug-neovim-rpc' | Plug 'gelguy/wilder.nvim' # wildmenu
    # Plug 'rhysd/committia.vim' # better git commit
    # Plug 'svermeulen/vim-macrobatics' #, { 'on': ['<plug>(Mac_Play)', '<plug>(Mac_RecordNew)', '<plug>(Mac_RotateBack)', '<plug>(Mac_RotateForward)', '<plug>(Mac_NameCurrentMacro)', '<plug>(Mac_SearchForNamedMacroAndSelect)', 'DisplayMacroHistory', '<plug>(Mac_Append)', '<plug>(Mac_Prepend)', '<plug>(Mac_SearchForNamedMacroAndPlay)', '<plug>(Mac_SearchForNamedMacroAndOverwrite)', '<plug>(Mac_SearchForNamedMacroAndDelete)', '<plug>(Mac_SearchForNamedMacroAndRename)'] } # macro enhance


    # Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() }, 'on': 'Clap' } # search

    # Plug 'Bakudankun/qline.vim' # statusline

    Plug 'Eliot00/git-lens.vim' # git blame in virtual text

    # Plug 'autozimu/LanguageClient-neovim', {
    #    \ 'branch': 'next',
    #    \ 'do': 'bash install.sh',
    #    \ }

    # Plug 'kennypete/vim-tene' # statusline

    # Plug 'Donaldttt/fuzzyy', { 'on': ['FuzzyGrep', 'FuzzyFiles', 'FuzzyHelps', 'FuzzyColors', 'FuzzyInBuffer', 'FuzzyCommands', 'FuzzyBuffers', 'FuzzyHighlights', 'FuzzyMRUFiles', 'FuzzyGitFiles'] } # telescope like search


    # Plug 'mcchrish/nnn.vim' # nnn

    Plug 'andymass/vim-matchup' # enhance %

    # Plug 'tpope/vim-rsi' | Plug 'matze/vim-move' # move line https://github.com/matze/vim-move/issues/15#issuecomment-763814712

    # Plug 'farmergreg/vim-lastplace' # remember last place

    # Plug 'hdima/python-syntax', { 'for': 'python' }
    # Plug 'tbastos/vim-lua', { 'for': 'lua' }
    # Plug 'liuchengxu/eleline.vim' # status bar
    # Plug 'itchyny/vim-gitbranch'
    # Plug 'powerline/powerline' # status bar, need python module, broken in venv
    # Plug 'pacha/vem-tabline' # bufferline
    # Plug 'bagrat/vim-buffet' # bufferline
    # Plug 'spolu/dwm.vim' # windown manager
    #
    # Plug 'vim-airline/vim-airline' # status bar and bufferline
    Plug 'tpope/vim-surround' # surround
    # Plug 'jackguo380/vim-lsp-cxx-highlight' # for cxx

    # Plug 'jacoborus/tender.vim' # 24bit colorscheme

    # Plug 'kyazdani42/nvim-web-devicons' # icons
    # Plug 'yaegassy/coc-ansible', {'do': 'yarn install --frozen-lockfile'}


    # Plug 'junegunn/fzf', { 'on': 'FZF' } # file picker
    # Plug 'wsdjeg/FlyGrep.vim', { 'on': 'FlyGrep' } # live grep
    # Plug 'ActivityWatch/aw-watcher-vim' # aw-watcher plugin
    # Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' } # file manager
    # Plug 'lambdalisue/fern.vim' # file manager
    # Plug 'nanotech/jellybeans.vim' # theme
    # Plug 'joshdick/onedark.vim' # theme
    # Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' } # file picker
    # Plug 'gelguy/cmd2.vim' # cmdline enhance
    # Plug 'LunarWatcher/auto-pairs' # auto pair
    # Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' } # undo viewer, but need vim with python support
    # Plug 'farmergreg/vim-lastplace' # save cursor position
    # Plug 'vim-airline/vim-airline-themes' # vim-airline-themes
    # Plug 'dracula/vim', { 'as': 'dracula' } # theme
    # Plug 'ryanoasis/vim-devicons' # iorns
    # Plug 'lambdalisue/nerdfont.vim' # icons
    # Plug 'Freed-Wu/airline-renderer-nerdfont.vim' # integrate with airline
    # Plug 'jasonccox/vim-wayland-clipboard' # wayland clipboard
    # Plug 'kh3phr3n/python-syntax', { 'for': 'python' }

    # Plug 'kshenoy/vim-signature'
    # Plug 'vimwiki/vimwiki'
    # Plug 'blindFS/vim-taskwarrior'

    Plug 'jeanCarloMachado/vim-toop'
    # Plug 'romainl/vim-devdocs'
    # Plug 'drzel/vim-scrolloff-fraction'

    # Plug 'clemedon/vim-reselect-two'
    # Plug 'TornaxO7/auto-cosco.vim', {'branch' : 'stable'}
    Plug 'ourgal/vim-zoom'
    Plug 'tpope/vim-dispatch'
    Plug 'eraserhd/parinfer-rust', { 'for': [ 'lisp', 'fennel' ] }
    Plug 'vlime/vlime', {'rtp': 'vim/', 'for': 'lisp'}
    Plug 'junegunn/vim-easy-align', { 'on': [ '<Plug>(EasyAlign)', 'EasyAlign' ] }
    Plug 'tommcdo/vim-exchange', { 'on': [ '<Plug>(Exchange)', '<Plug>(ExchangeClear)', '<Plug>(ExchangeLine)' ] }
    Plug 'wellle/visual-split.vim', { 'on': [ '<Plug>(Visual-Split-VSResize)', '<Plug>(Visual-Split-VSSplit)', '<Plug>(Visual-Split-VSSplitAbove)', '<Plug>(Visual-Split-VSSplitBelow)', '<Plug>(Visual-Split-Resize)', '<Plug>(Visual-Split-Split)', '<Plug>(Visual-Split-SplitAbove)', '<Plug>(Visual-Split-SplitBelow)' ] }
    Plug 'dense-analysis/ale'
    Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }
    Plug 'rhysd/git-messenger.vim', { 'on': [ 'GitMessenger', '<Plug>(git-messenger)' ] }
    Plug 'alker0/chezmoi.vim'
    Plug 'lervag/vimtex', { 'for': 'tex' }
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    # Plug 'girishji/fFtT.vim'
    # Plug 'vmchale/dhall-vim', { 'for': 'dhall' }
    Plug 'girishji/easyjump.vim'
    # Plug 'ubaldot/vim-highlight-yanked'
    # Plug 'bakpakin/fennel.vim', { 'for': 'fennel' }
    # Plug 'airblade/vim-rooter' # auto cwd, conflict with auto session
    # Plug 'yegappan/taglist' # ctags
    Plug 'preservim/tagbar', { 'on': 'TagbarToggle' } # ctags outline
    # Plug 'ourgal/vim9-toggle-words'
    # Plug 'junegunn/vim-peekaboo'
    Plug 'ourgal/vim-visual-star-search' # * search on visual selection
    # Plug 'tpope/vim-abolish'
    # Plug 'mhinz/vim-startify'
    # Plug 'itchyny/vim-gitbranch'
    Plug 'ourgal/vim-auto-save'
    # Plug 'girishji/vimcomplete' | Plug 'hrsh7th/vim-vsnip' | Plug 'hrsh7th/vim-vsnip-integ' | Plug 'yegappan/lsp'
    Plug 'girishji/devdocs.vim'
    Plug 'knsh14/vim-github-link', { 'on': [ 'GetCommitLink', 'GetCurrentBranchLink', 'GetCurrentCommitLink' ] }
    Plug 'editorconfig/editorconfig-vim'
    Plug 'tpope/vim-unimpaired'
    # Plug 'bullets-vim/bullets.vim', { 'for': 'markdown' }
    # Plug 'Exafunction/codeium.vim'
    # Plug 'mihaifm/bufstop'
    Plug 'laktak/tome', { 'on': [ 'TomePlayBook', 'TomeScratchPad', 'TomeScratchPadOnly' ] }
    # Plug 'zef/vim-cycle'
    Plug 'Yggdroot/indentLine'
    Plug 'git-time-metric/gtm-vim-plugin'
    # Plug 'habamax/vim-asciidoctor', { 'for': 'asciidoc' }
    Plug 'pbrisbin/vim-mkdir'
    Plug 'SidOfc/mkdx', { 'for': 'markdown' }
    Plug 'nanotee/zoxide.vim'
    # Plug 'prabirshrestha/vim-lsp'
    # Plug 'mattn/vim-lsp-settings'
    # Plug 'prabirshrestha/asyncomplete.vim'
    # Plug 'prabirshrestha/asyncomplete-lsp.vim'
plug#end()
#}}}

# load configs {{{
var confDir = $v .. '/plugins/'

for plugName in g:plugs->keys()
    const plugNameNoDot = plugName->substitute("\\.", "_", "")
    const conf = confDir .. plugNameNoDot  .. ".vim"
    const plugInstallDir = installDir .. plugName
    if isdirectory(plugInstallDir) && filereadable(conf)
        import conf
    endif
endfor
#}}}

colorscheme catppuccin_mocha
