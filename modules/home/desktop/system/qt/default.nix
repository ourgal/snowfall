{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    value = {
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
