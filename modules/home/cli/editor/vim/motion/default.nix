args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "easyjump-vim"
      "is-vim"
      "targets-vim"
      "undotree"
      "vim-exchange"
      "vim-matchup"
      "vim-repeat"
      "vim-sneak"
      "vim-subversive"
      "vim-surround"
      "vim-toop"
      "vim-unimpaired"
      "vim-visual-star-search"
      # keep-sorted end
    ];
    disable = [
      # keep-sorted start
      "gundo-vim"
      "ultisnips"
      "vim-cycle"
      "vim-snipewin"
      # keep-sorted end
    ];
  }
)
