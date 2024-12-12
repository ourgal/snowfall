args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace})
    nixosModule
    enabled
    disabled
    domains
    ;
  value = {
    networking = {
      networkmanager = enabled // {
        wifi.backend = "iwd";
      };
      # useDHCP = false;
      # useNetworkd = true;
      enableIPv6 = true;
      hosts = {
        "192.168.123.206" = builtins.attrValues domains;
      };
    };

    services.resolved = enabled;

    # services.avahi = enabled // {
    #   nssmdns4 = true;
    #   publish = enabled // {
    #     addresses = true;
    #     workstation = true;
    #   };
    # };

    systemd.network = disabled;
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
