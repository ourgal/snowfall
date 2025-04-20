args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      nixPkgs = "ashuffle";
      systemdServices.ashuffle = {
        Unit = {
          Requires = "dbus.socket";
          After = "mpd.service";
        };
        restart = "always";
        start = "${pkgs.ashuffle}/bin/ashuffle --queue-buffer 1";
      };
    }
  )
)
