args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      gapless = pkgs.writeShellScript "mp3_gapless" ''
        ffmpeg -i "$1" -f wav - | lame -V 2 --noreplaygain - "$2"
      '';
    in
    {
      path = ./.;
      progs.beets = {
        settings = {
          plugins = "fromfilename chroma lyrics fish convert fetchart embedart";
          convert = {
            "command" = "${gapless} $source $dest";
            "extension" = "mp3";
          };
          lyrics = {
            synced = "yes";
          };
        };
        package = (
          pkgs.beets.override {
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
