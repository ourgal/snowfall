{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "kompose"
      "kubectl"
      "kubernetes-helm"
    ];
  }
)
