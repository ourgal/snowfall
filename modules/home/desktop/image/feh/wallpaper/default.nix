args:
args.module (
  args
  // (
    let
      inherit (args) namespace pkgs;
    in
    {
      path = ./.;
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
        systemd.user.services.feh-wallsetter = {
          Unit = {
            Description = "feh wallsetter";
            ConditionEnvironment = "XAUTHORITY";
          };
          Install = {
            WantedBy = [ "graphical-session.target" ];
          };
          Service = {
            ExecStart = "${pkgs.${namespace}.feh-wallsetter}/bin/feh-wallsetter";
            Type = "oneshot";
          };
        };
      };
    }
  )
)
