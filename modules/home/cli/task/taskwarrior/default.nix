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
    value = {
      xdg.dataFile = {
        "task/hooks/on-modify.timewarrior" = {
          source = ./on-modify.timewarrior;
          executable = true;
        };
      };
    };
  }
)
