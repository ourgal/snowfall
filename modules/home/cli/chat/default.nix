{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "gomuks"
      "nchat"
    ];
    enable = "tg";
  }
)
