args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      progs.beets = {
        settings = {
          "plugins" = "fromfilename chroma lyrics fish";
        };
        package = (
          pkgs.beets.override {
            pluginOverrides = {
              fromfilename.enable = true;
              chroma.enable = true;
              lyrics.enable = true;
              fish.enable = true;
            };
          }
        );
      };
    }
  )
)
