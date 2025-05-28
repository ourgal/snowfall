{
  nixPkgs = "mdsf";
  progs.fish.interactiveShellInit = "mdsf completions fish | source";
}
