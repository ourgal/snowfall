{
  myPkgs = "stego";
  nixPkgs = [
    # keep-sorted start
    "bottom-rs"
    "enc"
    "genpass"
    "hashcat"
    "horcrux"
    "kryptor"
    "opensc"
    "pcsc-tools"
    "picocrypt-cli"
    "prs"
    "pwgen"
    "rage"
    "ssh-to-age"
    "ssss"
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
