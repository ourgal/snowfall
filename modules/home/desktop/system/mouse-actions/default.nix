args:
args.module (
  args
  // (
    let
      inherit (args)
        host
        lib
        namespace
        pkgs
        ;
    in
    {
      path = ./.;
      nixPkgs = "mouse-actions";
      confs."mouse-actions.json" = builtins.toJSON {
        "bindings" = [
          {
            "cmd" = [
              "pactl"
              "set-sink-volume"
              "@DEFAULT_SINK@"
              "+5%"
            ];
            "event" = {
              "button" = "WheelUp";
              "edges" = [
                "Right"
                "Top"
              ];
              "event_type" = "Release";
              "modifiers" = [ ];
              "shape" = [ ];
            };
          }
          {
            "cmd" = [
              "pactl"
              "set-sink-volume"
              "@DEFAULT_SINK@"
              "-5%"
            ];
            "event" = {
              "button" = "WheelDown";
              "edges" = [
                "Right"
                "Top"
              ];
              "event_type" = "Release";
              "modifiers" = [ ];
              "shape" = [ ];
            };
          }
        ];
        "shape_button" = "None";
      };
      value = {
        systemd.user.services.mouse-actions =
          lib.mkIf (builtins.elem host lib.${namespace}.settings.desktops)
            {
              Unit = {
                Description = "Mouse actions Service";
              };
              Install = {
                WantedBy = [ "default.target" ];
              };
              Service = {
                ExecStart = pkgs.writeShellScript "mouse-actions-script" ''
                  PATH=$PATH:${
                    lib.makeBinPath [
                      pkgs.pulseaudio
                      pkgs.mouse-actions
                    ]
                  }
                  mouse-actions
                '';
                Nice = -20;
              };
            };
      };
    }
  )
)
