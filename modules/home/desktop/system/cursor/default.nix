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
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Ice";
          size = 24;
        };
        catppuccin.pointerCursor = disabled;
      };
    }
  )
)
