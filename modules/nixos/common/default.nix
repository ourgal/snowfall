args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  enable = [
    "boot"
    "defaultPackages"
    "disk"
    "i18n"
    "localBin"
    "network"
    "ntp"
    "log"
    "nix"
    "user"
    "ssh"
    "timezone"
    "zram"
  ];
  _args = { inherit enable args; };
in
nixosModule _args
