{
  nixPkgs = [
    # keep-sorted start
    "diffnav"
    "riffdiff"
    "ydiff"
    # keep-sorted end
  ];
  progs.fish.functions.diffnav = {
    body = "git diff | command diffnav";
    description = "Diffnav";
  };
}
