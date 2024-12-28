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

              audio_output {
                  type        "httpd"
                  name        "My HTTP Stream"
                  encoder     "opus"      # optional
                  port        "8000"
                  # quality   "5.0"       # do not define if bitrate is defined
                  bitrate     "128000"    # do not define if quality is defined
                  format      "48000:16:1"
                  always_on   "yes"       # prevent MPD from disconnecting all listeners when playback is stopped.
                  tags        "yes"       # httpd supports sending tags to listening streams.
              }
            '';
          };
        }
      ];
      value = {
        xdg.userDirs = enabled // {
          createDirectories = true;
        };
      };
    }
  )
)
