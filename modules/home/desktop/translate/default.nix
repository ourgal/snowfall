{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "pot";
    nixPkgs = [
      # keep-sorted start
      "crow-translate"
      # keep-sorted end
    ];
  }
)
