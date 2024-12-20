args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = "nitrogen";
      systemdServices.nitrogen = {
        gui = true;
        type = "oneshot";
        start = "${pkgs.nitrogen}/bin/nitrogen --set-zoom-fill --random %h/Pictures/wallpapers/";
        condEnv = "XAUTHORITY";
        restart = "on-abort";
      };
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
      };
    }
  )
)
