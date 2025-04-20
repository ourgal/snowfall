{
  path = ./.;
  confs = {
    yazi = ./init.lua;
    "yazi/plugins" = [
      ./smart-enter.yazi
      ./smart-paste.yazi
      ./arrow.yazi
      ./parent-arrow.yazi
      ./ouch.yazi
      ./compress.yazi
      ./fast-enter.yazi
    ];
  };
  progs.yazi = {
    enableFishIntegration = true;
    keymap = {
      input = {
        prepend_keymap = [
          {
            on = [ "<Esc>" ];
            run = "close";
            desc = "Cancel input";
          }
        ];
      };
      manager = {
        prepend_keymap = [
          {
            on = [ "l" ];
            run = "plugin --sync fast-enter";
            desc = "Enter the subfolder faster, or open the file directly";
          }
          {
            on = [ "!" ];
            run = ''shell "$SHELL" --block --confirm'';
            desc = "Open shell here";
          }
          {
            on = [ "p" ];
            run = "plugin --sync smart-paste";
            desc = "Paste into the hovered directory or CWD";
          }
          {
            on = [ "<C-n>" ];
            run = ''shell 'dragon -x -i -T "$1"' --confirm'';
          }
          {
            on = [
              "g"
              "r"
            ];
            run = ''shell 'ya pub dds-cd --str "$(git rev-parse --show-toplevel)"' --confirm'';
          }
          {
            on = [ "k" ];
            run = "plugin --sync arrow --args=-1";
          }
          {
            on = [ "j" ];
            run = "plugin --sync arrow --args=1";
          }
          {
            on = [ "K" ];
            run = "plugin --sync parent-arrow --args=-1";
          }
          {
            on = [ "J" ];
            run = "plugin --sync parent-arrow --args=1";
          }
          {
            on = [ "C" ];
            run = "plugin ouch --args=zip";
            desc = "Compress with ouch";
          }
          {
            on = [
              "c"
              "a"
            ];
            run = "plugin compress";
            desc = "Archive selected files";
          }
        ];
      };
    };
  };
}
