args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      systemdServices.mpd-notification = {
        Unit = {
          Requires = "dbus.socket";
          PartOf = "graphical-session.target";
          After = [
            "mpd.service"
            "network.target"
            "network-online.target"
            "dunst.service"
            "xfce4-notifyd.service"
          ];
          ConditionUser = "!@system";
        };
        type = "notify";
        restart = "on-failure";
        start = "${pkgs.mpd-notification}/bin/mpd-notification";
      };
    }
  )
)
