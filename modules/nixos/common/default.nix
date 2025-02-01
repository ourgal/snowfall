args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabledList;
  value = {
    ${namespace}.common = enabledList [
      "boot"
      "defaultPackages"
      "disk"
      "i18n"
      "localBin"
      "network"
      "nix"
      "ssh"
      "timezone"
      "zram"
    ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
