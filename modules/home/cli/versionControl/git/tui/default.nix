{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "gex"
      "gitu"
      "tig"
      # keep-sorted end
    ];
  }
)
