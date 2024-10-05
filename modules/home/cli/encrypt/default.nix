{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "bottom-rs"
      "enc"
      "opensc"
      "pcsc-tools"
      "prs"
      "pwgen"
      "rage"
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
