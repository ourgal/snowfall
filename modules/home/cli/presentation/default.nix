{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "lookatme";
    nixPkgs = [
      "presenterm"
      "slides"
    ];
  }
)
