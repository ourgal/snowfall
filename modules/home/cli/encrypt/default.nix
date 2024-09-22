{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "bottom-rs"
      "git-agecrypt"
      "git-crypt"
      "opensc"
      "pcsc-tools"
      "ssh-to-age"
      # keep-sorted end
    ];
    pyPkgs = "names";
    enable = [
      # keep-sorted start
      "gopass"
      "gpg"
      "sops"
      # keep-sorted end
    ];
  }
)
