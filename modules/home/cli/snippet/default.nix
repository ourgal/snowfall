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
      "hoard"
      "nap"
      "the-way"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "navi"
      "pet"
      # keep-sorted end
    ];
  }
)
