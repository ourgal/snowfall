{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "git-agecrypt"
      "git-credential-gopass"
      "git-crypt"
      "gopass"
    ];
    pyPkgs = "names";
    enable = [
      "gpg"
      "sops"
    ];
  }
)
