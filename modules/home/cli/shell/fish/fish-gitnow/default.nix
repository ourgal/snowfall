args:
args.module (
  args
  // (
    let
      inherit (args) namespace lib pkgs;
    in
    {
      progs.fish = {
        plugins = lib.${namespace}.mkFishPlugins [ "fish-gitnow" ] pkgs;
      };
      files = {
        "" = ./.gitnow;
      };
    }
  )
)
