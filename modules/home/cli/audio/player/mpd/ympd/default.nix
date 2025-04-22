args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      port = 8001;
    in
    {
      systemdServices.ympd = {
        Unit = {
          Requires = "dbus.socket";
          After = "mpd.service";
        };
        restart = "always";
        start = "${pkgs.ympd}/bin/ympd --webport ${toString port}";
      };
    }
  )
)
