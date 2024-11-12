args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "mdsf";
    progs.fish.interactiveShellInit = "mdsf completions fish | source";
  }
)
