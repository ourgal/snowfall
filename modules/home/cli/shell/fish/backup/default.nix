args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace pkgs;
    in
    {
      path = ./.;
      progs.fish.plugins = lib.${namespace}.mkFishPlugins [
        # keep-sorted start
        "fifc"
        "fish-colored-man"
        "web-search.fish"
        # keep-sorted end
      ] pkgs;
    }
  )
)
