args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      files.".mpdcron/mpdcron.conf" = ''
        [main]
        modules = notification

        [notification]
        # Covers path, defaults to ~/.covers
        # cover_path = /path/to/cover/path
        # Cover suffix, defaults to jpg
        # cover_suffix = png
        # Notification timeout in milliseconds.
        timeout = 50000
        # Notification type
        type = mpd
        # Notification urgency, one of low, normal, critical
        urgency = normal
        # Notification hints in format TYPE:NAME:VALUE, specifies basic extra data
        # to pass. Valid types are int, double, string and byte
        hints =
      '';
      systemdServices.mpdcron = {
        Unit = {
          Requires = "dbus.socket";
          After = "mpd.service";
        };
        restart = "always";
        start = "${pkgs.mpdcron}/bin/mpdcron --no-daemon";
        env = "PATH=${pkgs.libnotify}/bin";
      };
    }
  )
)
