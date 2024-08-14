{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "gomuks"
      "nchat"
      # keep-sorted end
    ];
    enable = "tg";
  }
)
