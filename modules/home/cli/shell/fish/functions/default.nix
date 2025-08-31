args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace host;
      inherit (lib.${namespace}) settings;
      inherit (builtins) elem;
    in
    {
      enable =
        [
          # keep-sorted start
          "mkcd"
          "ranger"
          "scroff"
          "tstickers"
          # keep-sorted end
        ]
        ++ (if elem host settings.desktops && !elem host settings.work then [ "live-wallpaper" ] else [ ]);
    }
  )
)
