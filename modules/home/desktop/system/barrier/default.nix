{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) host lib pkgs;
      isClient = (host != "home");
      serverHost = "home.local";
      isServer = (host == "home");
    in
    {
      path = ./.;
      nixPkgs = "barrier";
      value = {
        xdg.dataFile = lib.mkIf isServer { "barrier/.barrier.conf".source = ./barrier.conf; };
        systemd.user.services.barriers = lib.mkIf isServer {
          Unit = {
            Description = "barrier server";
            ConditionEnvironment = "XAUTHORITY";
          };
          Install = {
            WantedBy = [ "graphical-session.target" ];
          };
          Service = {
            ExecStartPre = "${pkgs.coreutils-full}/bin/sleep 15";
            ExecStart = "${pkgs.barrier}/bin/barriers -a :: -f --disable-client-cert-checking --disable-crypto";
            Restart = "always";
            RestartSec = 3;
          };
        };

        systemd.user.services.barrierc = lib.mkIf isClient {
          Unit = {
            Description = "Barrier Client daemon";
            After = [ "graphical-session-pre.target" ];
            PartOf = [ "graphical-session.target" ];
            ConditionEnvironment = "XAUTHORITY";
          };
          Install.WantedBy = [ "graphical-session.target" ];
          Service.ExecStart = "${pkgs.barrier}/bin/barrierc --disable-crypto -f ${serverHost}";
        };
      };
    }
  )
)
