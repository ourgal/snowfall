args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "context-vim"
      "indentLine"
      "lightline-vim"
      "quick-scope"
      "vim-highlightedyank"
      "vim-polyglot"
      "vim-which-key"
      "vim-zoom"
      "visual-split-vim"
      # keep-sorted end
    ];
    disable = "rainbow";
  }
)
