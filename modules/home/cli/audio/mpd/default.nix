{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "mpc-cli"
      "vimpc"
    ];
    progs = {
      ncmpcpp = {
        bindings = [
          {
            key = "j";
            command = "scroll_down";
          }
          {
            key = "k";
            command = "scroll_up";
          }
          {
            key = "l";
            command = "next_column";
          }
          {
            key = "h";
            command = "previous_column";
          }
        ];
      };
    };
    servs = [
      "mpd-mpris"
      {
        mpd = {
          extraConfig = ''
            auto_update "yes"
          '';
        };
      }
    ];
    value = with args; {
      xdg.userDirs = enabled // {
        createDirectories = true;
      };
    };
  }
)
