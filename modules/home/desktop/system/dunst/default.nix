args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      servs.dunst = {
        iconTheme = {
          name = "Adwaita";
          package = pkgs.adwaita-icon-theme;
        };
        settings = {
          global = {
            font = "Iosevka Nerd Font 14";
          };
          play_sound = {
            summary = "*";
            script = toString (
              # https://dunst-project.org/documentation/#SCRIPTING
              pkgs.writeShellScript "alert" ''
                BELL=${pkgs.${namespace}.soundfx}/bling1.mp3

                [[ $DUNST_SUMMARY == "MPD Notification" ]] && exit
                [[ $DUNST_SUMMARY == "Espanso" ]] && exit
                [[ $DUNST_SUMMARY == "Switch group" ]] && exit
                [[ $DUNST_SUMMARY =~ "Battery is*" ]] && exit

                ${pkgs.pulseaudio}/bin/paplay "$BELL"
              ''
            );
          };
        };
      };
      confs.dunst = ./mp3_CARTOON_BELL_Medium_Size_Ring_Tinkle_Fast_Sequence_02.mp3;
    }
  )
)
