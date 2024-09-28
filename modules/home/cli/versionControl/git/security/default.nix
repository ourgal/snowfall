{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "git-secret"
      "gitleaks"
      # keep-sorted end
    ];
  }
)
