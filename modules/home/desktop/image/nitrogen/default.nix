args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      nixPkgs = "nitrogen";
      systemdServices.nitrogen = {
        gui = true;
        type = "oneshot";
        start = "${lib.getExe pkgs.nitrogen} --set-zoom-fill --random %h/Pictures/wallpapers/";
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
