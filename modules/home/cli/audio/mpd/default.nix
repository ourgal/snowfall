args:
args.module (
  args
  // (
    let
      inherit (args) enabled lib namespace;
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
      progs.ncmpcpp.bindings = lib.${namespace}.mkNcmpcppBindings {
        j = "scroll_down";
        k = "scroll_up";
        l = "next_column";
        h = "previous_column";
      };
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
        # keep-sorted start
        "http"
        "mpd-mpris"
        # keep-sorted end
      ];
      value = {
        xdg.userDirs = enabled // {
          createDirectories = true;
        };
      };
    }
  )
)
