args:
args.module (
  args
  // (
    let
      inherit (args) enabled pkgs disabled;
    in
    {
      path = ./.;
      value = {
        home.pointerCursor = {
          gtk = enabled;
          x11 = enabled;
          package = pkgs.oreo-cursors-plus;
          name = "oreo_spark_blue_bordered_cursors";
          size = 24;
        };
        catppuccin.pointerCursor = disabled;
      };
    }
  )
)
