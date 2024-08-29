{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args)
        lib
        namespace
        config
        pkgs
        ;
      inherit (lib.${namespace}) cfgHome switch;
      cfg = cfgHome config.${namespace} ./.;
    in
    {
      path = ./.;
      nixPkgs = "transmission_4";
      myPkgs = "anime";
      value = {
        systemd.user.services.transmission = lib.mkIf cfg.service.enable {
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
      extraOpts = {
        service = switch;
      };
    }
  )
)
