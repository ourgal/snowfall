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
      "vim-indent-guides"
      "vim-polyglot"
      "vim-which-key"
      "vim-zoom"
      "visual-split-vim"
      # keep-sorted end
    ];
    disable = [
      # keep-sorted start
      "indentLine"
      "rainbow"
      # keep-sorted end
    ];
  }
)
