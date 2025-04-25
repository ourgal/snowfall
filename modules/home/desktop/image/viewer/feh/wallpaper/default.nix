args:
args.module (
  args
  // (
    let
      inherit (args) namespace pkgs;
    in
    {
      systemdServices.feh-wallsetter = {
        gui = true;
        type = "oneshot";
        condEnv = "XAUTHORITY";
        start = "${pkgs.${namespace}.feh-wallsetter}/bin/feh-wallsetter";
      };
      value = {
        systemd.user.timers.feh-wallsetter = {
          Unit = {
            Description = "feh wallsetter";
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
