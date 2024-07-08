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
  }
)
