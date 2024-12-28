args:
args.module (
  args
  // (
    let
      inherit (args) enabled;
    in
    {
      path = ./.;
      nixPkgs = [
        # keep-sorted start
        "mmtc"
        "mpc-cli"
        "vimpc"
        # keep-sorted end
      ];
      progs.ncmpcpp.bindings = [
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
      servs.mpd = {
        network = {
          listenAddress = "any";
          startWhenNeeded = true;
        };
        extraConfig = ''
          auto_update "yes"
          audio_output {
              type        "pulse"
              name        "My Pulse Output"
          #   server      "remote_server"     # optional
          #   sink        "remote_server_sink"    # optional
          }
        '';
      };
      enable = [
        "http"
        "mpd-notification"
        "mpd-mpris"
      ];
      value = {
        xdg.userDirs = enabled // {
          createDirectories = true;
        };
      };
    }
  )
)
