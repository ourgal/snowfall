args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "serpl";
    confs."serpl/config.toml" = {
      keybindings = {
        "<Ctrl-q>" = "Quit";
      };
    };
  }
)
