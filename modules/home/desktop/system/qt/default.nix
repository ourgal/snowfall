args:
args.module (
  args
  // (
    let
      inherit (args) config lib;
    in
    {
      value = lib.mkIf (!config.stylix.enable) {
        # Theme QT -> GTK
        qt = {
          enable = true;
          platformTheme.name = "kvantum";
          style = {
            name = "kvantum";
          };
        };
      };
    }
  )
)
