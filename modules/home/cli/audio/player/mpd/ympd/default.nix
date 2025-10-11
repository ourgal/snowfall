args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
      port = 8001;
    in
    {
      systemdServices.ympd = {
        Unit = {
          Requires = "dbus.socket";
          After = "mpd.service";
        };
        restart = "always";
        start = "${lib.getExe pkgs.ympd} --webport ${toString port}";
      };
    }
  )
)
