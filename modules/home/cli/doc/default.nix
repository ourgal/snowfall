{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "archwiki";
    nixPkgs = [
      # keep-sorted start
      "bk"
      "cheat"
      "halp"
      # keep-sorted end
    ];
    enable = "tealdeer";
  }
)
