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
      myPkgs = "miniflux-sync";
      nixPkgs = "matcha-rss-digest";
      enable = if elem host settings.desktops && !elem host settings.work then "newsboat" else [ ];
    }
  )
)
