args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "nchat"
      "toot"
      "toxic"
      # keep-sorted end
    ];
    enable = "tg";
  }
)
