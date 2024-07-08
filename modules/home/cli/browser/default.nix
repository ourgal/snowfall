{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "amfora"
      "circumflex"
      "w3m"
    ];
  }
)
