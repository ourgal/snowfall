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
  inherit (builtins) elem attrValues;
  enableWiFi = elem host laptops || host == "t4";
  value = {
    networking = {
      networkmanager = (if enableWiFi then enabled else disabled) // {
        wifi.backend = "iwd";
      };
      enableIPv6 = true;
      hosts = {
        "${ip.brix}" = attrValues domains;
      };
    };

    systemd.network = disabled;

    hardware.enableAllFirmware = if enableWiFi then true else false;
  };
  enable = "sysctl";
  _args = { inherit value args enable; };
in
nixosModule _args
