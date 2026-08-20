{
  myPkgs = "wait-for";
  perlPkgs = "vidir";
  nixPkgs = [
    # keep-sorted start
    "empty"
    "parallel"
    "progress"
    "retry"
    "rush"
    "wait4x"
    "with-shell"
    # keep-sorted end
  ];
  files.".parallel/will-cite" = "";
}
