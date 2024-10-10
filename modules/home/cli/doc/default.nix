{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "archwiki"
      "eg"
      # keep-sorted end
    ];
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
