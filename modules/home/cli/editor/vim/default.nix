args:
args.module (
  args
  // {
    path = ./.;
    progs.vim.extraConfig = (builtins.readFile ./option.vim) + (builtins.readFile ./keymap.vim);
    enable = [
      # keep-sorted start
      "ale"
      "bufexplorer"
      "catppuccin-vim"
      "caw-vim"
      "chezmoi-vim"
      "coc-nvim"
      "devdocs-vim"
      "easyjump-vim"
      "editorconfig-vim"
      "fzf-vim"
      "git-lens-vim"
      "git-messager-vim"
      "gtm-vim-plugin"
      "indentLine"
      "lexima-vim"
      "lightline-vim"
      "mkdx"
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
      "vim-github-link"
      "vim-grepper"
      "vim-highlightedyank"
      "vim-latex-live-preview"
      "vim-ledger"
      "vim-matchup"
      "vim-mkdir"
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
      "vim-tome"
      "vim-toop"
      "vim-unimpaired"
      "vim-visual-star-search"
      "vim-which-key"
      "vim-workspace"
      "vim-zoom"
      "vimsuggest"
      "visual-split-vim"
      "vlime"
      "wiki-vim"
      "zoxide-vim"
      # keep-sorted end
    ];
    dataFiles = {
      "vim/.keep" = "";
      "vim/swap/.keep" = "";
    };
    files.".vim" = [
      ./ftplugin
      ./coc-settings.json
      ./plugin
      ./macro.vim
      ./templates
    ];
  }
)
