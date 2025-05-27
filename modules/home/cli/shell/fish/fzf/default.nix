args:
args.module (
  args
  // (
    let
      inherit (args) namespace lib pkgs;
    in
    {
      progs.fish = {
        plugins = lib.${namespace}.mkFishPlugins [ "fzf" ] pkgs;
      };
      env = {
        FZF_LEGACY_KEYBINDINGS = "1";
        FZF_COMPLETE = "2";
      };
    }
  )
)
