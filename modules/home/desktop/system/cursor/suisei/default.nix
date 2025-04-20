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
      value = {
        home.pointerCursor = {
          gtk = enabled;
          x11 = enabled;
          package = pkgs.${namespace}.hoshimachi-suisei-cursors;
          name = "Hoshimachi-Suisei";
          size = 24;
        };
        catppuccin.cursors = disabled;
      };
    }
  )
)
