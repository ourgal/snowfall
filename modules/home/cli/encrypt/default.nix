{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "bottom-rs"
      "git-agecrypt"
      "git-credential-gopass"
      "git-crypt"
      "gopass"
      "ssh-to-age"
      # keep-sorted end
    ];
    pyPkgs = "names";
    enable = [
      # keep-sorted start
      "gpg"
      "sops"
      # keep-sorted end
    ];
  }
)
