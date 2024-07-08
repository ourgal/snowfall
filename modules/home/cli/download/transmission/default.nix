{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "transmission_4";
    myPkgs = "anime";
    value = with args; {
      systemd.user.services.transmission = {
        Unit = {
          Description = "Transmission Service";
          Wants = "network-online.target";
          After = "network-online.target";
        };
        Service = {
          ExecStart = "${pkgs.transmission_4}/bin/transmission-daemon -f -g ${config.xdg.configHome}/transmission/transmission-daemon";
          ExecReload = "${pkgs.coreutils-full}/bin/kill -HUP $MAINPID";
          Restart = "on-abort";
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
      };
    };
  }
)
