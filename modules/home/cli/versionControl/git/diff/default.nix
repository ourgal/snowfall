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
  progs.git.settings."color \"diff\"" = {
    meta = "blue bold";
    frag = "magenta";
    context = "white";
    whitespace = "yellow reverse";
    old = "red";
  };
  enable = "diff-so-fancy";
}
