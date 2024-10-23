args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "lookatme";
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
