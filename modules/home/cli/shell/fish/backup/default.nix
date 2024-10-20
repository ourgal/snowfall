args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
    in
    {
      path = ./.;
      progs.fish.plugins = lib.${namespace}.mkFishPlugins [
        # keep-sorted start
        "fifc"
        "fish-colored-man"
        "fish-f"
        "web-search.fish"
        # keep-sorted end
      ];
    }
  )
)
