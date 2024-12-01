args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "stego";
    nixPkgs = [
      # keep-sorted start
      "bottom-rs"
      "enc"
      "genpass"
      "hashcat"
      "horcrux"
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
      "rbw"
      "sops"
      # keep-sorted end
    ];
  }
)
