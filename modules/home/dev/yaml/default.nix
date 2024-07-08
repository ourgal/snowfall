{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "yaml-language-server"
      "yamlfmt"
    ];
  }
)
