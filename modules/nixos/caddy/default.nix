{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule mkDockerProxy;
  docker = config.${namespace}.docker;
  host = "brix.local";
  value = {
    services.caddy = mkDockerProxy { inherit docker host; };
    networking.firewall.allowedTCPPorts = [
      80
      443
    ];
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
