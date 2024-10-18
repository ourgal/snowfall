args:
args.module (
  args
  // {
    path = ./.;
    value = {
      systemd.user.services.scream = {
        Unit = {
          Description = "nm-applet";
          Wants = "network-online.target";
          After = "network-online.target";
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
        Service = {
          ExecStart = "${args.pkgs.scream}/bin/nm-applet";
          Restart = "always";
          RestartSec = 10;
        };
      };
    };
  }
)
