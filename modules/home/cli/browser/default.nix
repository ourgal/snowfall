{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "lobtui";
    nixPkgs = [
      # keep-sorted start
      "amfora"
      "circumflex"
      "w3m"
      # keep-sorted end
    ];
    enable = "brotab";
  }
)
