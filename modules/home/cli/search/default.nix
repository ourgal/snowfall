args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "fpp"
      "fzf"
      "fzf-make"
      "fzy"
      "skim"
      "zf"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "fzf-kill"
      "zfind"
      # keep-sorted end
    ];
  }
)
