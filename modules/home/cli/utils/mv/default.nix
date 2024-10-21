args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "classifier";
    nixPkgs = [
      # keep-sorted start
      "edir"
      "f2"
      "mmv-go"
      "nomino"
      "rnr"
      # keep-sorted end
    ];
  }
)
