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
                  type            "pipewire"
                  name            "PipeWire Sound Server"
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
