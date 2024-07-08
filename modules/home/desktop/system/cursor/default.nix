{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    value = with args; {
      home.pointerCursor = {
        gtk = enabled;
        x11 = enabled;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
      };
      catppuccin.pointerCursor = disabled;
    };
  }
)
