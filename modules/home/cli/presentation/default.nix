args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "lookatme";
    haskellPkgs = "patat";
    nixPkgs = [
      # keep-sorted start
      "doitlive"
      "mdp"
      "presenterm"
      "pysentation"
      "slides"
      # keep-sorted end
    ];
  }
)
