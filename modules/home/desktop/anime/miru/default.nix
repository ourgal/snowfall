args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
      fileTypes = [ "x-scheme-handler/miru" ];
      defaults = lib.${namespace}.defaultTypes "miru.desktop" fileTypes;
    in
    {
      path = ./.;
      myPkgs = "miru";
      value = defaults;
    }
  )
)
