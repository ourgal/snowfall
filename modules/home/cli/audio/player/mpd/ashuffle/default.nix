args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      nixPkgs = "ashuffle";
      systemdServices.ashuffle = {
        Unit = {
          Requires = "dbus.socket";
          After = "mpd.service";
        };
        restart = "always";
        start = "${lib.getExe pkgs.ashuffle} --queue-buffer 1";
      };
    }
  )
)
