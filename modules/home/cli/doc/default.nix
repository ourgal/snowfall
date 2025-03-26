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
      "qman"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "bk"
      "jiten"
      "ccal"
      "cheat"
      "dasht"
      "halp"
      "wiki-tui"
      # keep-sorted end
    ];
    enable = "tealdeer";
  }
)
