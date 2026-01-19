args:
args.module (
  args
  // (
    let
      inherit (args) namespace pkgs lib;
    in
    {
      value = {
        stylix = lib.${namespace}.stylix.defaultConfig pkgs;
      };
    }
  )
)
