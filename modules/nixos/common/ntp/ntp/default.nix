args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule;
  value = {
    services.ntp = {
      enable = true;
      servers = config.networking.timeServers;
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
