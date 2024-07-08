{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "kotlin"
      "kotlin-language-server"
    ];
  }
)
