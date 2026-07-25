args:
args.module (
  args
  // (
    let
      inherit (args) config namespace;
    in
    {
      progs.navi = {
        enableFishIntegration = !config.${namespace}.cli.versionControl.lazygit.shortcut.enable;
        enableZshIntegration = !config.${namespace}.cli.versionControl.lazygit.shortcut.enable;
      };
      dataFiles."navi/cheats" = ./my_cheats;
    }
  )
)
