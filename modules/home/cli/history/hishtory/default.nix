args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "hishtory";
    progs = {
      fish.interactiveShellInit = builtins.readFile ./config.fish;
      zsh.initExtra = builtins.readFile ./config.zsh;
    };
  }
)
