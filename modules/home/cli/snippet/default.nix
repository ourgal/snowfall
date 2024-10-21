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
    nixPkgs = "pet";
    enable = "navi";
  }
)
