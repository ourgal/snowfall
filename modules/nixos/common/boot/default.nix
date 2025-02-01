args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    boot.initrd.systemd = enabled // {
      emergencyAccess = config.users.users.root.hashedPassword;
      inherit (config.systemd) network;
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
