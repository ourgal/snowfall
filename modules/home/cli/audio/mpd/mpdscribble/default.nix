args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = "mpdscribble";
      systemdServices.mpdscribble = {
        Unit = {
          Requires = "dbus.socket";
          After = [
            "mpd.service"
            "network-online.target"
          ];
          ConditionUser = "!@system";
        };
        restart = "on-failure";
        start = "${pkgs.mpdscribble}/bin/mpdscribble -D";
      };
    }
  )
)
