args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "classifier"
      "dext"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "detox"
      "edir"
      "f2"
      "mmv-go"
      "nomino"
      "rnr"
      # keep-sorted end
    ];
  }
)
