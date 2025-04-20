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
  _args = { inherit value args; };
in
nixosModule _args
