args:
args.module (
  args
  // (
    let
      inherit (args) config pkgs;
    in
    {
      systemdServices.transmission = {
        online = true;
        start = "${pkgs.transmission_4}/bin/transmission-daemon -f -g ${config.xdg.configHome}/transmission/transmission-daemon";
        reload = "${pkgs.coreutils-full}/bin/kill -HUP $MAINPID";
        restart = "on-abort";
      };
    }
  )
)
