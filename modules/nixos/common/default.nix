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
      "log"
      "nix"
      "user"
      "ssh"
      "timezone"
      "zram"
    ];
  };
  _args = { inherit value args; };
in
nixosModule _args
