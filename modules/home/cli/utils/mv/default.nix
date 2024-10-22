args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "classifier"
      "dext"
      "dlorg"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "detox"
      "edir"
      "f2"
      "massren"
      "mmv-go"
      "nomino"
      "rnr"
      # keep-sorted end
    ];
  }
)
