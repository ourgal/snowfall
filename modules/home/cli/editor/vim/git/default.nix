args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "git-lens-vim"
      "git-messager-vim"
      "gv-vim"
      "vim-fugitive"
      "vim-gitgutter"
      "vim-github-link"
      "vim-rhubarb" # Github support
      # keep-sorted end
    ];
    disable = [
      # keep-sorted start
      "gitv"
      "vim-signify"
      # keep-sorted end
    ];
  }
)
