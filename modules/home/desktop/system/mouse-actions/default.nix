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
      volume = pkgs.writeShellScript "set volume" ''
        pactl set-sink-volume @DEFAULT_SINK@ "$1"
        volnoti-show $(pamixer --get-volume)
      '';
    in
    {
      path = ./.;
      nixPkgs = "mouse-actions";
      confs."mouse-actions.json" = {
        "bindings" = [
          {
            "cmd" = [
              "${volume}"
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
              "${volume}"
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
      systemdServices.mouse-actions = (
        if (builtins.elem host lib.${namespace}.settings.desktops) then
          {
            start = pkgs.writeShellScript "mouse-actions-script" ''
              PATH=$PATH:${
                lib.makeBinPath [
                  pkgs.pulseaudio
                  pkgs.mouse-actions
                  pkgs.pamixer
                  pkgs.volnoti
                ]
              }
              mouse-actions
            '';
            nice = -20;
          }
        else
          { }
      );
    }
  )
)
