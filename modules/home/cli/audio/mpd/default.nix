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
        "pms"
        "rmpc"
        "vimpc"
        # keep-sorted end
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
        # keep-sorted start
        "ashuffle"
        "http"
        "mpd-mpris"
        "mympd"
        "ncmpcpp"
        "sptlrx"
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
