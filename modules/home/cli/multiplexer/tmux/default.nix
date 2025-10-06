{
  nixPkgs = [
    # keep-sorted start
    "smug"
    "tmuxinator"
    "tmuxp"
    # keep-sorted end
  ];
  myPkgs = [
    # keep-sorted start
    "fzfp"
    "git-mux"
    # keep-sorted end
  ];
  enable = [
    # keep-sorted start
    "plugins"
    "base"
    "resurrect"
    "scripts"
    "themes"
    # keep-sorted end
  ];
}
