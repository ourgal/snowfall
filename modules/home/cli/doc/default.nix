args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "archwiki"
      "eg"
      "lib-x"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "bk"
      "cheat"
      "dasht"
      "halp"
      # keep-sorted end
    ];
    enable = "tealdeer";
  }
)
