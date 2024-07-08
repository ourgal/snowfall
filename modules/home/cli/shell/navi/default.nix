{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      navi = {
        enableFishIntegration = false;
      };
    };
    dataFiles = {
      "navi/cheats" = ./my_cheats;
    };
  }
)
