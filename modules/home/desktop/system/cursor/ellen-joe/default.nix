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
          package = pkgs.${namespace}.ellen-joe-cursors;
          name = "Ellen-Joe";
          size = 24;
        };
        catppuccin.cursors = disabled;
      };
    }
  )
)
