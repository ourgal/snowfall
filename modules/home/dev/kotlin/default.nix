args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "kotlin"
      "kotlin-language-server"
      # keep-sorted end
    ];
  }
)
