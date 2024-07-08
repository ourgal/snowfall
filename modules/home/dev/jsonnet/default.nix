{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "jsonnet"
      "jsonnet-language-server"
    ];
  }
)
