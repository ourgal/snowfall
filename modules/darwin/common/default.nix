args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule disabled enabled;
  user = config.${namespace}.user.name;
  enable = [
    "defaultPackages"
    "nix"
    "ssh"
    "timezone"
  ];
  value = {
    snowfallorg.users.${user}.home =
      if config.${namespace}.home-manager.enable then enabled else disabled;
  };
  _args = { inherit enable args value; };
in
nixosModule _args
