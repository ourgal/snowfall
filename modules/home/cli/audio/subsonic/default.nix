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
      enable = if elem host settings.desktops && !elem host settings.work then "termsonic" else [ ];
    }
  )
)
