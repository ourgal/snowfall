args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      confs."listenbrainz-mpd/config.toml" = { };
      systemdServices.listenbrainz-mpd = {
        Unit = {
          After = "mpd.service";
        };
        Install = {
          WantedBy = "mpd.services";
        };
        restart = "always";
        start = "${lib.getExe pkgs.listenbrainz-mpd}";
      };
    }
  )
)
