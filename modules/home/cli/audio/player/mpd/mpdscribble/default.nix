args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
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
        start = "${lib.getExe pkgs.mpdscribble} -D";
      };
    }
  )
)
