{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "gogitmoji"
      "goji"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "commitizen"
      "gitmoji-cli"
      # keep-sorted end
    ];
    enable = "geminicommit";
  }
)
