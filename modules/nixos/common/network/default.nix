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
  inherit (lib) mkDefault;
  value = {
    networking = {
      networkmanager = mkDefault enabled // {
        wifi.backend = "iwd";
      };
      # useDHCP = false;
      # useNetworkd = true;
      enableIPv6 = true;
      hosts = {
        "${ip.brix}" = builtins.attrValues domains;
      };
    };

    services.resolved = mkDefault enabled;
    services.avahi = disabled // {
      nssmdns4 = true;
      publish = enabled // {
        addresses = true;
        workstation = true;
      };
    };

    systemd.network = mkDefault disabled;

    hardware.enableAllFirmware = if (builtins.elem host laptops) then true else false;
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
