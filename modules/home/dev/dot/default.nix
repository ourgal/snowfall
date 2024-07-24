{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "dot-language-server"
      "graphviz"
    ];
  }
)
