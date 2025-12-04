args:
args.module (
  args
  // (
    let
      inherit (args) pkgs config;
      gapless = pkgs.writeShellScript "mp3_gapless" ''
        ffmpeg -i "$1" -f wav - | lame -V 2 --noreplaygain - "$2"
      '';
    in
    {
      progs.beets = {
        settings = {
          plugins = "mpdupdate fromfilename chroma lyrics fish convert fetchart embedart";
          convert = {
            "command" = "${gapless} $source $dest";
            "extension" = "mp3";
          };
          lyrics = {
            synced = "yes";
          };
          directory = config.services.mpd.musicDirectory;
        };
        package = (
          pkgs.python3Packages.beets.override {
            pluginOverrides = {
              fromfilename.enable = true;
              chroma.enable = true;
              lyrics.enable = true;
              fish.enable = true;
              convert.enable = true;
              fetchart.enable = true;
            };
          }
        );
      };
    }
  )
)
