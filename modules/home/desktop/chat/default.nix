args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "discord"
      "element-desktop"
      "telegram-desktop"
      # keep-sorted end
    ];
  }
)
