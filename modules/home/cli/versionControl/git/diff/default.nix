{
  nixPkgs = "delta";
  progs.git.settings."color \"diff\"" = {
    meta = "blue bold";
    frag = "magenta";
    context = "white";
    whitespace = "yellow reverse";
    old = "red";
  };
  enable = "diff-so-fancy";
}
