{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "git-agecrypt"
      "git-crypt"
      "git-secret"
      "gitleaks"
      # keep-sorted end
    ];
  }
)
