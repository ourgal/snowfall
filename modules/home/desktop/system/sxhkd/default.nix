args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      servs.sxhkd.keybindings = {
        "F2" = pkgs.writeShellScript "image name" ''
          xdotool click 3
          xdotool key r
          xdotool key ctrl+c
          xdotool key Return
        '';
        "F3" = pkgs.writeShellScript "download metadata" ''
          sleep 0.5
          xdotool type --delay 100 "e"
          sleep 0.5

          clipboard=$(xsel -b)
          if [[ $clipboard =~ ^https.+ ]]; then
             asin=$(echo "$clipboard" | sed -E "s/.+(product|dp)\/(.+)\?ref.+/\2/")
             echo "amazon_jp:$asin" | xsel -bi
          fi

          xdotool key alt+i
          xdotool key ctrl+v
          sleep .2
          xdotool key Return
          sleep 0.5
        '';
        # "F2" = pkgs.writeShellScript "save image" ''
        #   delay=0.3
        #   xdotool key ctrl+s
        #   sleep $delay
        #   xdotool type "tempCover"
        #   xdotool key Return
        #   xdotool key Return
        #   sleep $delay
        #   xdotool key ctrl+w
        #   xdotool key super+1
        #   sleep $delay

        #   xdotool key Up
        #   sleep $delay
        #   xdotool type "xcp"
        #   sleep $delay
        #   xdotool key Tab

        #   xdotool key alt+e
        #   xdotool type "\$"
        #   xdotool type "bbb"
        #   xdotool key ctrl+a
        #   xdotool type "ZZ"
        #   sleep $delay
        #   xdotool key Return
        # '';
      };
    }
  )
)
