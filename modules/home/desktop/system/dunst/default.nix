args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      servs.dunst.settings = {
        global = {
          font = "Iosevka Nerd Font 14";
        };
        play_sound = {
          summary = "*";
          script = toString (
            pkgs.writeShellScript "alert" ''
              ${pkgs.pulseaudio}/bin/paplay ~/.config/dunst/mp3_CARTOON_BELL_Medium_Size_Ring_Tinkle_Fast_Sequence_02.mp3
            ''
          );
        };
      };
      confs.dunst = ./mp3_CARTOON_BELL_Medium_Size_Ring_Tinkle_Fast_Sequence_02.mp3;
    }
  )
)
