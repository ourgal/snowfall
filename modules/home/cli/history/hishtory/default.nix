args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "hishtory";
    progs.fish.interactiveShellInit = "source ${./config.fish}";
  }
)
