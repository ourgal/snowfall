{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "taskwarrior-tui"
      "timewarrior"
    ];
    progs = with args; [
      {
        taskwarrior = {
          package = pkgs.taskwarrior3;
        };
      }
      {
        fish = {
          shellAbbrs = {
            t = "taskwarrior-tui";
          };
        };
      }
    ];
  }
)
