{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    servs = with args; {
      sxhkd = {
        keybindings = {
          "F1" = pkgs.writeShellScript "image name" ''
            xdotool click 3
            xdotool key r
            xdotool key ctrl+c
            xdotool key Return
          '';
          "F2" = pkgs.writeShellScript "save image" ''
            delay=0.3
            xdotool key ctrl+s
            sleep $delay
            xdotool type "tempCover"
            xdotool key Return
            xdotool key Return
            sleep $delay
            xdotool key ctrl+w
            xdotool key super+1
            sleep $delay

            xdotool key Up
            sleep $delay
            xdotool type "xcp"
            sleep $delay
            xdotool key Tab

            xdotool key alt+e
            xdotool type "\$"
            xdotool type "bbb"
            xdotool key ctrl+a
            xdotool type "ZZ"
            sleep $delay
            xdotool key Return
          '';
        };
      };
    };
  }
)
