args:
args.module (
  args
  // {
    path = ./.;
    progs.navi = {
      enableFishIntegration = false;
      enableZshIntegration = false;
    };
    dataFiles."navi/cheats" = ./my_cheats;
  }
)
