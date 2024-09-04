{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "inotify-tools"
      "trackma-curses"
    ];
    confs = {
      trackma = ./config.json;
    };
    progs = {
      fish = {
        shellAbbrs = {
          tmc = "trackma-curses";
        };
      };
    };
  }
)
