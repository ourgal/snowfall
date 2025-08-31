args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace host;
      inherit (lib.${namespace}) settings;
      inherit (builtins) elem;
    in
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
        "sops"
        # keep-sorted end
      ] ++ (if elem host settings.desktops && !elem host settings.work then [ "rbw" ] else [ ]);
    }
  )
)
