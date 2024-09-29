{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "gogitmoji";
    nixPkgs = [
      # keep-sorted start
      "commitizen"
      "gitmoji-cli"
      # keep-sorted end
    ];
    enable = "geminicommit";
  }
)
