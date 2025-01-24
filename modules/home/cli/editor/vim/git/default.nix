args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "conflict-marker-vim"
      "git-lens-vim"
      "git-messager-vim"
      "gv-vim"
      "vim-flog"
      "vim-fugitive"
      "vim-gitgutter"
      "vim-github-link"
      "vim-rhubarb" # Github support
      # keep-sorted end
    ];
    disable = [
      # keep-sorted start
      "gitv"
      "vim-gh-line" # open the browser
      "vim-signify"
      # keep-sorted end
    ];
  }
)
