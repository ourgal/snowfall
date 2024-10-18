args:
args.module (
  args
  // {
    path = ./.;
    servs.dunst.settings = {
      global = {
        font = "FiraCode Nerd Font 14";
      };
      play_sound = {
        summary = "*finished";
        script = "~/.config/dunst/alert.sh";
      };
    };
    confs.dunst = [
      ./alert.sh
      ./mp3_CARTOON_BELL_Medium_Size_Ring_Tinkle_Fast_Sequence_02.mp3
    ];
  }
)
