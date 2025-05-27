args:
args.module (
  args
  // (
    let
      inherit (args)
        namespace
        lib
        pkgs
        config
        ;
      __done_notification_command =
        if config.${namespace}.user.terminal == "kitty" then
          ''set -gx __done_notification_command "${pkgs.libnotify}/bin/notify-send \$title \$message"''
        else
          null;
    in
    {
      progs.fish = {
        interactiveShellInit = # fish
          ''
            ${__done_notification_command}
          '';
        plugins = lib.${namespace}.mkFishPlugins [ "done" ] pkgs;
      };
    }
  )
)
