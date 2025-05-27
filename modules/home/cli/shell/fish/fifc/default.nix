args:
args.module (
  args
  // (
    let
      inherit (args) namespace lib pkgs;
    in
    {
      progs.fish = {
        plugins = lib.${namespace}.mkFishPlugins [ "fifc" ] pkgs;
      };
      env = {
        fifc_keybinding = "\\cx";
      };
    }
  )
)
