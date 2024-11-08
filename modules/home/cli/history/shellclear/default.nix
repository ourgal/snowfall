args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "shellclear";
    progs.fish.interactiveShellInit = "shellclear --init-shell | source";
  }
)
