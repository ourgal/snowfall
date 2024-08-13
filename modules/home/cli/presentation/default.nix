{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "lookatme";
    nixPkgs = [
      # keep-sorted start
      "mdp"
      "presenterm"
      "slides"
      # keep-sorted end
    ];
  }
)
