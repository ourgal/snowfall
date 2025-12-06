args:
args.module (
  args
  // (
    let
      inherit (args) target lib namespace;
      inherit (lib.${namespace}) isX86;
    in
    {
      enable = isX86 target "discord";
      nixPkgs = [
        # keep-sorted start
        "ayugram-desktop"
        "element-desktop"
        "kotatogram-desktop"
        "materialgram"
        "telegram-desktop"
        # keep-sorted end
      ];
    }
  )
)
