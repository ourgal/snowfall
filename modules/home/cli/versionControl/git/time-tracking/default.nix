args:
args.module (
  args
  // (
    let
      inherit (args) target lib namespace;
      inherit (lib.${namespace}) isX86;
    in
    {
      myPkgs = [
        # keep-sorted start
        "git-spend"
        # keep-sorted end
      ];
      enable = isX86 target "gtm";
    }
  )
)
