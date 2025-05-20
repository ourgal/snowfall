args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    enabled
    disabled
    domains
    ip
    ;
  inherit (config.${namespace}.user) host;
  inherit (lib.${namespace}.settings) laptops;
  value = {
    networking = {
      networkmanager = (if (builtins.elem host laptops) then enabled else disabled) // {
        wifi.backend = "iwd";
      };
      enableIPv6 = true;
      hosts = {
        "${ip.brix}" = builtins.attrValues domains;
      };
    };

    systemd.network = disabled;

    hardware.enableAllFirmware = if (builtins.elem host laptops) then true else false;
  };
  enable = "sysctl";
  _args = { inherit value args enable; };
in
nixosModule _args
