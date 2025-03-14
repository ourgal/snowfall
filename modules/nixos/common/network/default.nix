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
      # useDHCP = false;
      # useNetworkd = true;
      enableIPv6 = true;
      hosts = {
        "${ip.brix}" = builtins.attrValues domains;
      };
    };

    services.resolved = disabled;
    services.avahi = enabled // {
      nssmdns4 = true;
      publish = enabled // {
        addresses = true;
        workstation = true;
      };
    };

    systemd.network = disabled;

    hardware.enableAllFirmware = if (builtins.elem host laptops) then true else false;
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
