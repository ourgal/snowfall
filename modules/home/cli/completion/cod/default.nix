args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "cod";
    progs.fish.interactiveShellInit = ''
      cod init $fish_pid fish | source
    '';
  }
)
