args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "nchat"
      "toot"
      # keep-sorted end
    ];
    enable = "tg";
  }
)
