{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) config pkgs;
    in
    {
      path = ./.;
      value = {
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
)
