args:
args.module (
  args
  // (
    let
      inherit (args)
        enabled
        pkgs
        disabled
        namespace
        ;
    in
    {
      path = ./.;
      value = {
        home.pointerCursor = {
          gtk = enabled;
          x11 = enabled;
          package = pkgs.${namespace}.frieren-cursors;
          name = "frieren-cursors";
          size = 24;
        };
        catppuccin.pointerCursor = disabled;
      };
    }
  )
)