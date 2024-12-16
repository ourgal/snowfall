args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
      fileTypes = [ "x-scheme-handler/akuse" ];
      defaults = lib.${namespace}.defaultTypes "akuse-beta.desktop" fileTypes;
    in
    {
      path = ./.;
      myPkgs = "akuse";
      value = defaults;
    }
  )
)
