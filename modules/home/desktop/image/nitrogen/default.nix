{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = "nitrogen";
      value = {
        systemd.user.timers.nitrogen = {
          Unit = {
            Description = "nitrogen wallsetter";
            ConditionEnvironment = "XAUTHORITY";
          };
          Install = {
            WantedBy = [ "graphical-session.target" ];
          };
          Timer = {
            OnUnitActiveSec = "10m";
          };
        };
        systemd.user.services.nitrogen = {
          Unit = {
            Description = "nitrogen wallsetter";
            ConditionEnvironment = "XAUTHORITY";
          };
          Install = {
            WantedBy = [ "graphical-session.target" ];
          };
          Service = {
            ExecStart = "${pkgs.nitrogen}/bin/nitrogen --set-zoom-fill --random $HOME/Pictures/wallpapers/";
            Type = "oneshot";
          };
        };
      };
    }
  )
)
