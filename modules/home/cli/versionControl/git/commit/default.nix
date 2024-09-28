{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "commitizen"
      "gitmoji-cli"
      # keep-sorted end
    ];
    enable = "geminicommit";
  }
)
