{
  nixPkgs = [
    # keep-sorted start
    "delta"
    "diffnav"
    "riffdiff"
    "ydiff"
    # keep-sorted end
  ];
  progs.fish.functions.diffnav = {
    body = "git diff | command diffnav";
    description = "Diffnav";
  };
  enable = "diff-so-fancy";
}
