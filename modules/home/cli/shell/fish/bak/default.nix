args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace pkgs;
    in
    {
      progs.fish.plugins = lib.${namespace}.mkFishPlugins [
        # keep-sorted start
        "fifc"
        "fish-colored-man"
        "fishbang"
        "web-search.fish"
        # keep-sorted end
      ] pkgs;
    }
  )
)
