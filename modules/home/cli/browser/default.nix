{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "amfora"
      "circumflex"
      "w3m"
      # keep-sorted end
    ];
  }
)
