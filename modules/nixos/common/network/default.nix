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
      networkmanager = enabled // {
        wifi.backend = "iwd";
        dns = if (builtins.elem host laptops) then "dnsmasq" else "none";
      };
      # useDHCP = false;
      # useNetworkd = true;
      enableIPv6 = true;
      hosts = {
        "${ip.brix}" = builtins.attrValues domains;
      };
      nameservers = [ ip.brix ];
    };

    services.avahi = enabled // {
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
