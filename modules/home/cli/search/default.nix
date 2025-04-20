{
  path = ./.;
  nixPkgs = [
    # keep-sorted start
    "docfd"
    "fpp"
    "fzf-make"
    "fzy"
    "skim"
    "src-cli"
    "zf"
    "zfind"
    # keep-sorted end
  ];
  myPkgs = [
    # keep-sorted start
    "fzf-kill"
    # keep-sorted end
  ];
  enable = [
    "fzf"
    "television"
  ];
}
