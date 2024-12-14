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
  inherit (lib.${namespace}.settings) desktops;
  value = {
    networking = {
      networkmanager = enabled // {
        wifi.backend = "iwd";
      };
      # useDHCP = false;
      # useNetworkd = true;
      enableIPv6 = true;
      hosts = {
        "${ip.brix}" = builtins.attrValues domains;
      };
    };

    services.resolved = if (builtins.elem host desktops) then enabled else disabled;
    services.avahi = (if (!builtins.elem host desktops) then enabled else disabled) // {
      nssmdns4 = true;
      publish = enabled // {
        addresses = true;
        workstation = true;
      };
    };

    systemd.network = disabled;
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
