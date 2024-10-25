args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "corgi"
      "ehh"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "nap"
      "pet"
      "the-way"
      # keep-sorted end
    ];
    enable = "navi";
  }
)
