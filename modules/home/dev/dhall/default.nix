{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "dhall"
      "dhall-json"
      "dhall-yaml"
      "dhall-lsp-server"
    ];
  }
)
