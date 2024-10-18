args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "kompose"
      "kubectl"
      "kubernetes-helm"
      # keep-sorted end
    ];
  }
)
