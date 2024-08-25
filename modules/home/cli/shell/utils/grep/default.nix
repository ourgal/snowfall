{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "sig";
    nixPkgs = [
      # keep-sorted start
      "ripgrep"
      "ugrep"
      # keep-sorted end
    ];
  }
)
