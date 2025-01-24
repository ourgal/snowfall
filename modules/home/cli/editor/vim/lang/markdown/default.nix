args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "pangu-vim"
      "vim-markdown"
      "wiki-vim"
      # keep-sorted end
    ];
    disable = [
      # keep-sorted start
      "mkdx"
      "vim-table-mode"
      # keep-sorted end
    ];
  }
)
