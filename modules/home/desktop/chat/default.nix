args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "discord"
      "element-desktop"
      "kotatogram-desktop"
      "telegram-desktop"
      # keep-sorted end
    ];
  }
)
