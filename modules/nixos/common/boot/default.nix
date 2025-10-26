args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled disabled;
  inherit (config.${namespace}.user) host;
  value = {
    boot.initrd.systemd = (if host != "n1" then enabled else disabled) // {
      emergencyAccess = config.users.users.root.hashedPassword;
      inherit (config.systemd) network;
    };
    boot.loader.systemd-boot.configurationLimit = 5;
  };
  _args = { inherit value args; };
in
nixosModule _args
