args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "lightline-vim"
      "quick-scope"
      "tagbar"
      "vim-gutentags"
      "vim-highlightedyank"
      "vim-polyglot"
      "vim-which-key"
      "vim-zoom"
      "visual-split-vim"
      # keep-sorted end
    ];
    disable = [
      # keep-sorted start
      "vim-indent-guides"
      "indentLine"
      "rainbow"
      # keep-sorted end
    ];
  }
)
