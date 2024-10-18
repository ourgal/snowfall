args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled disabled;
  value = {
    networking = {
      networkmanager = enabled // {
        wifi.backend = "iwd";
      };
      # useDHCP = false;
      # useNetworkd = true;
      enableIPv6 = true;
    };

    services.resolved = enabled;
    systemd.network = disabled;
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
