{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "bottom-rs"
      "opensc"
      "pcsc-tools"
      "prs"
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
